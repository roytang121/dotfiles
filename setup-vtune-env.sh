#!/usr/bin/env bash
# File: /usr/local/bin/setup-vtune-env.sh
# Usage:
#   sudo bash setup-vtune-env.sh          → full install + config
#   sudo bash setup-vtune-env.sh -c          → config-only (fast, safe to run after every kernel update)

set -euo pipefail

CONFIG_ONLY=0
[[ "${1:-}" == "--config-only" || "${1:-}" == "-c" ]] && CONFIG_ONLY=1

if [[ $CONFIG_ONLY -eq 1 ]]; then
    echo "Config-only mode enabled – skipping package installation and driver build"
fi

# ------------------------------------------------------------------
# 1. Full install part (skipped in config-only mode)
# ------------------------------------------------------------------
if [[ $CONFIG_ONLY -eq 0 ]]; then
    echo "Installing intel-oneapi-vtune and build tools..."
    apt update -qq
    apt install -y intel-oneapi-vtune linux-headers-$(uname -r) build-essential dkms

    echo "Building SEP drivers..."
    VTUNE_DIR=$(find /opt/intel/oneapi/vtune -mindepth 1 -maxdepth 1 -type d -name "202*" | sort -r | head -n1)
    cd "$VTUNE_DIR/sepdk/src"
    ./build-driver -j$(nproc)
    ./boot-script --install
fi

# ------------------------------------------------------------------
# 2. Always run this part – safe and idempotent
# ------------------------------------------------------------------
echo "Applying kernel settings for VTune + perf..."

cat >/etc/sysctl.d/99-vtune-perf.conf <<EOF
# VTune Profiler & perf optimal settings
kernel.yama.ptrace_scope = 0
kernel.perf_event_paranoid = -1
kernel.kptr_restrict = 0
EOF

# Only add i915 line if the Intel GPU driver is actually loaded
if lsmod | grep -q i915; then
    echo "dev.i915.perf_stream_paranoid = 0" >> /etc/sysctl.d/99-vtune-perf.conf
fi

sysctl --load=/etc/sysctl.d/99-vtune-perf.conf > /dev/null

# Load SEP drivers if they exist (does nothing if already loaded)
if [[ -d "/opt/intel/oneapi/vtune" ]]; then
    VTUNE_DIR=$(find /opt/intel/oneapi/vtune -mindepth 1 -maxdepth 1 -type d -name "202*" | sort -r | head -n1)
    SEP_INS="$VTUNE_DIR/sepdk/src/insmod-sep"
    if [[ -x "$SEP_INS" ]]; then
        echo "Loading SEP drivers..."
        "$SEP_INS" -r 2>/dev/null || true
        "$SEP_INS" > /dev/null
    fi
fi

# Ensure user is in vtune group
getent group vtune >/dev/null || groupadd vtune
if [[ -n "${SUDO_USER:-}" ]]; then
    usermod -aG vtune "$SUDO_USER"
else
    usermod -aG vtune "$USER"
fi

# ------------------------------------------------------------------
# 3. Summary
# ------------------------------------------------------------------
echo
echo "VTune environment ready"
echo "   ptrace_scope        : $(cat /proc/sys/kernel/yama/ptrace_scope)"
echo "   perf_event_paranoid : $(cat /proc/sys/kernel/perf_event_paranoid)"
echo "   SEP drivers loaded  : $(lsmod | grep -E 'sep5|pax|socperf' | wc -l) modules"
echo "   In vtune group      : $(groups ${SUDO_USER:-$USER} 2>/dev/null | grep -qw vtune && echo yes || echo no)"
echo
echo "Log out and back in (or run 'newgrp vtune') for group changes."
echo "You are now good to go with full hardware sampling (SEP or driverless perf)."

exit 0

# Loading env:
# source /opt/intel/oneapi/vtune/latest/env/vars.sh
#
# Testing it
# vtune -collect hotspots -knob sampling-mode=hw -- sleep 1
