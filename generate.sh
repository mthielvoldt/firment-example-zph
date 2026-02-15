if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "ERROR: This script must be sourced. Run it with: source ${BASH_SOURCE[0]}"
    exit 1
fi

# Activate the venv with west installed if not already.
if [ ! "$VIRTUAL_ENV" ]; then
  . .venv/bin/activate
fi

export ZEPHYR_SDK_INSTALL_DIR="$(pwd)/zephyr-sdk-0.17.4"

west build -b nucleo_l476rg --build-dir build/nucleo app
