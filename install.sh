#!/bin/bash

# Homebase Installation Script v2.0
# Exit on any error and treat undefined variables as errors
set -euo pipefail

# Configuration
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly LOG_FILE="${SCRIPT_DIR}/homebase.log"
readonly HELPERS_FILE="${SCRIPT_DIR}/scripts/helpers.sh"
readonly COPY_DOTFILES="${SCRIPT_DIR}/scripts/copy_dotfiles.sh"

# Source helper functions
if [[ -f "$HELPERS_FILE" ]]; then
    source "$HELPERS_FILE"
else
    echo "ERROR: helpers.sh not found at $HELPERS_FILE" >&2
    exit 1
fi

# Display initial banner
show_init_banner() {
    echo
    echo -e "${BLUE:-}"
    cat << 'EOF'
  ██╗  ██╗ ██████╗ ███╗   ███╗███████╗██████╗  █████╗ ███████╗███████╗
  ██║  ██║██╔═══██╗████╗ ████║██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝
  ███████║██║   ██║██╔████╔██║█████╗  ██████╔╝███████║███████╗█████╗  
  ██╔══██║██║   ██║██║╚██╔╝██║██╔══╝  ██╔══██╗██╔══██║╚════██║██╔══╝  
  ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗██████╔╝██║  ██║███████║███████╗
  ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
                          -- v2.0.0 --                                                                  
EOF
    echo -e "${NC:-}"
    echo
}

# Display success banner
show_success_banner() {
    echo
    echo -e "${GREEN:-}"
    cat << 'EOF'
    ███████╗██╗   ██╗ ██████╗ ██████╗███████╗███████╗███████╗██╗
    ██╔════╝██║   ██║██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝██║
    ███████╗██║   ██║██║     ██║     █████╗  ███████╗███████╗██║
    ╚════██║██║   ██║██║     ██║     ██╔══╝  ╚════██║╚════██║╚═╝
    ███████║╚██████╔╝╚██████╗╚██████╗███████╗███████║███████║██╗
    ╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝╚═╝
    
                    🎉 Homebase is configured! 🎉
EOF
    echo -e "${NC:-}"
    echo
}

# Detect and validate Debian-based systems
detect_debian_system() {
    log_step "Checking for apt package manager..."
    
    if ! command -v apt >/dev/null 2>&1; then
        log_error "apt command not found - this is not a Debian/Ubuntu system"
        return 1
    fi
    
    log_success "apt is available!"
    log_step "Determining distribution..."
    
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        case "${ID:-}" in
            ubuntu)
                log_success "Ubuntu detected (version: ${CYAN}${VERSION_ID:-unknown}${NC})"
                return 0
                ;;
            debian)
                log_success "Debian detected (version: ${CYAN}${VERSION_ID:-unknown}${NC})"
                return 0
                ;;
            *)
                log_success "Other apt-based system detected: ${CYAN}${PRETTY_NAME:-$ID}${NC}"
                return 0
                ;;
        esac
    else
        log_warning "apt-based system detected but cannot determine specific distribution"
        return 0
    fi
}

# Run macOS installation
run_macos_install() {
    log_success "macOS detected!"
    local macos_script="${SCRIPT_DIR}/scripts/install_macos.sh"
    
    if [[ -x "$macos_script" ]]; then
        log_step "Running macOS installation script..."
        "$macos_script"
    else
        log_warning "macOS installation script not found or not executable: $macos_script"
    fi
}

# Run Debian/Ubuntu installation
run_debian_install() {
    log_success "Debian-based system detected!"
    
    # Validate the system first
    if ! detect_debian_system; then
        log_error "Failed to validate Debian-based system"
        return 1
    fi
    
    local debian_script="${SCRIPT_DIR}/scripts/install_debian.sh"
    
    if [[ -x "$debian_script" ]]; then
        log_step "Running Debian/Ubuntu installation script..."
        source $debian_script
        install_debian
    else
        log_warning "Debian installation script not found or not executable: $debian_script"
    fi
}

# Determine operating system and run appropriate installer
determine_os() {
    log_step "Detecting operating system..."
    
    case "${OSTYPE:-}" in
        darwin*)
            run_macos_install
            ;;
        linux*)
            # For Linux, we need to check the distribution
            if [[ -f /etc/os-release ]]; then
                source /etc/os-release
                case "${ID:-}" in
                    ubuntu|debian|pop|mint|elementary)
                        run_debian_install
                        ;;
                    fedora|rhel|centos)
                        log_error "Red Hat-based distributions not supported yet"
                        return 1
                        ;;
                    arch|manjaro)
                        log_error "Arch-based distributions not supported yet"
                        return 1
                        ;;
                    *)
                        log_error "Unsupported Linux distribution: ${YELLOW}${PRETTY_NAME:-$ID}${NC}"
                        return 1
                        ;;
                esac
            else
                log_error "Cannot determine Linux distribution - ${YELLOW}/etc/os-release${NC} not found"
                return 1
            fi
            ;;
        linux-android)
            log_error "Android/Termux not supported at this time"
            return 1
            ;;
        solaris*)
            log_error "Solaris not supported"
            return 1
            ;;
        *bsd*)
            log_error "BSD variants not supported at this time"
            return 1
            ;;
        msys*|cygwin*)
            log_error "Windows/Cygwin not supported at this time"
            return 1
            ;;
        *)
            log_error "Unknown or unsupported operating system: ${YELLOW}${OSTYPE:-unknown}${NC}"
            return 1
            ;;
    esac
}

# Cleanup function for error handling
cleanup() {
    local exit_code=$?
    if [[ $exit_code -ne 0 ]]; then
        log_error "Script failed with exit code $exit_code"
        log_info "Check $LOG_FILE for more details"
    fi
}

# Main execution function
main() {
    # Set up error handling
    trap cleanup EXIT
    
    log_info "-------------- Begin Homebase Installation v2.0.0 --------------"
    
    # Clear screen and show banner
    clear
    show_init_banner
    
    log_info "Homebase directory: ${SCRIPT_DIR}"
    # Detect OS and run appropriate installer
    if determine_os; then
        log_success "Installation completed successfully!"
        show_success_banner
    else
        log_error "Installation failed"
        return 1
    fi
    
    log_info "-------------- End Homebase Installation --------------"
}

# Script entry point
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi