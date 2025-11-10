#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

echo "Luvadryer Startup Script"
echo "======================="
echo "Directory: $SCRIPT_DIR"
echo ""

# Check if executable exists
if [ ! -f "luvadryer" ]; then
  echo "ERROR: Executable not found!"
  exit 1
fi

# Make executable
chmod +x luvadryer 2>/dev/null || true

# Check dependencies
echo "Checking dependencies..."
if command -v ldd >/dev/null 2>&1; then
  MISSING_LIBS=$(ldd luvadryer 2>&1 | grep "not found" || true)
  if [ -n "$MISSING_LIBS" ]; then
    echo ""
    echo "ERROR: Missing required libraries:"
    echo "$MISSING_LIBS"
    echo ""
    echo "Please install the required libraries:"
    echo "  Ubuntu/Debian: sudo apt-get install libgtk-3-0 libnotify4 libnss3 libxss1 libxtst6 xdg-utils libatspi2.0-0 libdrm2 libgbm1"
    echo "  Fedora/RHEL: sudo dnf install gtk3 libnotify nss libXScrnSaver libXtst xdg-utils at-spi2-core libdrm mesa-libgbm"
    exit 1
  fi
  echo "All dependencies found!"
else
  echo "Warning: ldd command not found, skipping dependency check"
fi

echo ""
echo "Launching Luvadryer..."
exec ./luvadryer "$@"
