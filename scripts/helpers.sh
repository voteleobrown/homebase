# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m' # No Color

# Unicode symbols
readonly CHECK_MARK="✅" # "✓"
readonly CROSS_MARK="❌" # "✗"
readonly WARNING="⚠️" # "⚠"
readonly INFO="ℹ️" # "ℹ"
readonly ARROW="➡️" # "→"
readonly ROCKET="🚀"

# Logging functions
log() {
    local level="$1"
    shift
    local message="$*"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    # Write to log file
    echo "[$timestamp] [$level] $message" >> "${LOG_FILE:='default.log'}"
    
    # Output to console based on level
    case "$level" in
        "ERROR")
            echo -e "${RED}${CROSS_MARK} $message${NC}" >&2
            ;;
        "SUCCESS")
            echo -e "${GREEN}${CHECK_MARK} $message${NC}"
            ;;
        "WARNING")
            echo -e "${YELLOW}${WARNING} $message${NC}"
            ;;
        "INFO")
            echo -e "${PURPLE}${INFO} $message${NC}"
            ;;
        "DEBUG")
            # Always write to log file, only show on console if verbose
            if [[ "$INIT_VERBOSE" == "true" ]]; then
                echo -e "${PURPLE}DEBUG: $message${NC}"
            fi
            ;;
        "STEP")
            echo -e "${CYAN}${ARROW} $message${NC}"
            ;;
        *)
            echo "$message"
            ;;
    esac
}

log_error() { 
    log "ERROR" "$@"
     echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ERROR] ---------- End Deploy Run ------------" >> "$LOG_FILE"
}
log_success() { log "SUCCESS" "$@"; }
log_warning() { log "WARNING" "$@"; }
log_info() { log "INFO" "$@"; }
log_debug() { log "DEBUG" "$@"; }
log_step() { log "STEP" "$@"; }