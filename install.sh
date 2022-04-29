#!/bin/sh

set -euo pipefail

cd "$(dirname "$0")"

setup_homebrew() {
  echo "setting up homebrew"

    if test ! "$(command -v brew)"; then
        echo "Homebrew not installed. Installing."
        # Run as a login shell (non-interactive) so that the script doesn't pause for user input
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
}

sudo apt install -y fish
setup_homebrew
brew bundle