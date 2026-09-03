#!/usr/bin/env bash
set -e

PYVER=$(python3 - <<'EOF'
import sys
print(f"{sys.version_info.major}.{sys.version_info.minor}")
EOF
)

debug=$@
if [ ! -z "$debug" ]; then
    echo "[*] Detected python version: $PYVER"
fi

LOCAL_SITE="/usr/local/lib64/python${PYVER}/site-packages"
SYS_SITE="/usr/lib64/python${PYVER}/site-packages"

if [ ! -d "$LOCAL_SITE" ]; then
    echo "[!] $LOCAL_SITE not found"
    exit 1
fi

HOWDY_COMPARE="/usr/local/lib64/howdy/compare.py"

if ! grep -q "$LOCAL_SITE" "$HOWDY_COMPARE"; then
    echo "[*] Patching howdy compare.py"
    sed -i "1i import sys\nsys.path.insert(0, '$LOCAL_SITE')\nsys.path.insert(0, '$SYS_SITE')\n" "$HOWDY_COMPARE"
else
    if [ ! -z "$debug" ]; then
      echo "[*] Howdy already patched"
    fi
fi

if [ ! -z "$debug" ]; then
    echo "[✓] Howdy Fedora fix applied"
fi
