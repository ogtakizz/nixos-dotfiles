#!/bin/bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Default dotfiles repository
DOTFILES_REPO="${DOTFILES_REPO:-}"
DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"

# Function to create necessary directories
create_directories() {
    print_status "Creating necessary directories..."
    
    # Common directories that should exist in a minimal NixOS installation
    local dirs=(
        "$HOME/Documents"
        "$HOME/Downloads"
        "$HOME/Pictures"
        "$HOME/Videos"
        "$HOME/Music"
        "$HOME/.local/bin"
        "$HOME/.local/share"
        "$HOME/.config"
        "$HOME/.cache"
        "$HOME/src"
        "$HOME/tmp"
    )
    
    for dir in "${dirs[@]}"; do
        if [[ ! -d "$dir" ]]; then
            mkdir -p "$dir"
            print_status "Created directory: $dir"
        else
            print_status "Directory already exists: $dir"
        fi
    done
}

# Function to prompt for dotfiles repository
prompt_repo() {
    if [[ -z "$DOTFILES_REPO" ]]; then
        echo -n "Enter your dotfiles repository URL (GitHub): "
        read -r DOTFILES_REPO
        
        if [[ -z "$DOTFILES_REPO" ]]; then
            print_error "No repository provided. Exiting."
            exit 1
        fi
    fi
}

# Function to clone dotfiles repository
clone_dotfiles() {
    print_status "Cloning dotfiles from $DOTFILES_REPO..."
    
    if [[ -d "$DOTFILES_DIR" ]]; then
        print_warning "Dotfiles directory already exists. Removing..."
        rm -rf "$DOTFILES_DIR"
    fi
    
    if git clone "$DOTFILES_REPO" "$DOTFILES_DIR"; then
        print_status "Successfully cloned dotfiles to $DOTFILES_DIR"
    else
        print_error "Failed to clone dotfiles repository"
        exit 1
    fi
}

# Function to check if flake.nix exists
check_flake() {
    if [[ ! -f "$DOTFILES_DIR/flake.nix" ]]; then
        print_error "No flake.nix found in $DOTFILES_DIR"
        exit 1
    fi
    print_status "Found flake.nix in dotfiles"
}

# Function to install NixOS flake
install_flake() {
    print_status "Installing NixOS flake..."
    
    cd "$DOTFILES_DIR"
    
    # Check if we have sudo access
    if ! sudo -n true 2>/dev/null; then
        print_status "Requesting sudo access for NixOS configuration..."
        sudo -v || { print_error "Sudo access required for NixOS configuration"; exit 1; }
    fi
    
    # Rebuild NixOS configuration
    if sudo nixos-rebuild switch --flake .; then
        print_status "Successfully installed NixOS flake configuration"
    else
        print_error "Failed to install NixOS flake"
        exit 1
    fi
}

# Function to show usage
usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -r, --repo <url>    Dotfiles repository URL"
    echo "  -d, --dir <path>    Dotfiles directory (default: ~/.dotfiles)"
    echo "  -h, --help          Show this help message"
    echo ""
    echo "Environment variables:"
    echo "  DOTFILES_REPO       Dotfiles repository URL"
    echo "  DOTFILES_DIR        Dotfiles directory (default: ~/.dotfiles)"
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -r|--repo)
            DOTFILES_REPO="$2"
            shift 2
            ;;
        -d|--dir)
            DOTFILES_DIR="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            print_error "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Main execution
main() {
    print_status "Starting NixOS dotfiles setup..."
    
    # Check if running on NixOS
    if [[ ! -f /etc/nixos/configuration.nix ]] && [[ ! -d /etc/nixos ]]; then
        print_warning "This script is designed for NixOS systems"
        read -p "Continue anyway? (y/N): " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            exit 0
        fi
    fi
    
    create_directories
    prompt_repo
    clone_dotfiles
    check_flake
    install_flake
    
    print_status "NixOS dotfiles setup completed successfully!"
}

# Run main function
main "$@"