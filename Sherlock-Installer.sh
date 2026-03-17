#!/data/data/com.termux/files/usr/bin/bash

# ============================================
# SHERLOCK FRAMEWORK Style v1.0
# ============================================
# Creator  : Sunil [ Prince4you ]
# Channel  : Noob Cyber Tech
# GitHub   : Prince4you
# ============================================

# Colors - Simple & Clean
G='\033[1;32m'    # Success
R='\033[1;31m'    # Error
Y='\033[1;33m'    # Warning
B='\033[1;34m'    # Info
C='\033[1;36m'    # Highlight
W='\033[1;37m'    # White
GR='\033[0;90m'   # Gray
NC='\033[0m'      # No Color

# Framework style
VERSION="1.0"
CREATOR="Sunil [ Prince4you ]"
CHANNEL="Noob Cyber Tech"
GITHUB="Prince4you"

# Directories
SHERLOCK_DIR="$HOME/sherlock"
START_TIME=$(date +%s)

# ============================================
# BANNER - Simple & Clean
# ============================================
show_banner() {
    clear
    echo -e """${C}┏━┛┃ ┃┏━┛┏━┃┃  ┏━┃┏━┛┃ ┃  ┛┏━ ┏━┛━┏┛┏━┃┃  ┃  ┏━┛┏━┃
━━┃┏━┃┏━┛┏┏┛┃  ┃ ┃┃  ┏┛   ┃┃ ┃━━┃ ┃ ┏━┃┃  ┃  ┏━┛┏┏┛
━━┛┛ ┛━━┛┛ ┛━━┛━━┛━━┛┛ ┛  ┛┛ ┛━━┛ ┛ ┛ ┛━━┛━━┛━━┛┛ ┛
${NC}"""
}

# ============================================
# SIMPLE STATUS FUNCTIONS
# ============================================

# Success Message
ok() { echo -e "${G}[✓]${NC} $1"; }

# Error Message
no() { echo -e "${R}[✗]${NC} $1"; }

# Warning Message
warn() { echo -e "${Y}[!]${NC} $1"; }

# Info Message
info() { echo -e "${B}[i]${NC} $1"; }

# Arrow Message
arrow() { echo -e "${C}[→]${NC} $1"; }

# Star Message
star() { echo -e "${GR}[⭐]${NC} $1"; }

# Time Function
time_now() { echo -e "${GR}[$(date '+%H:%M:%S')]${NC} $1"; }

# Line Separator
line() { echo -e "${GR}────────────────────────────────────${NC}"; }

# ============================================
# CHECK FUNCTIONS
# ============================================

# Check Termux
check_termux() {
    time_now "$(info "Checking Termux...")"
    if [[ -d "/data/data/com.termux" ]] || [[ -n "$TERMUX_VERSION" ]]; then
        ok "Termux detected"
    else
        no "This script works only in Termux!"
        exit 1
    fi
}

# Check Internet
check_internet() {
    time_now "$(info "Checking internet...")"
    if ping -c 1 8.8.8.8 >/dev/null 2>&1 || ping -c 1 google.com >/dev/null 2>&1; then
        ok "Internet connected"
    else
        no "No internet connection!"
        exit 1
    fi
}

# Check Storage
check_storage() {
    time_now "$(info "Checking storage...")"
    
    if [[ ! -d "$HOME/storage" ]]; then
        warn "Storage access required"
        termux-setup-storage
        sleep 2
    fi
    
    local total=$(df -h "$HOME" | awk 'NR==2 {print $2}')
    local used=$(df -h "$HOME" | awk 'NR==2 {print $3}')
    local avail=$(df -h "$HOME" | awk 'NR==2 {print $4}')
    
    ok "Total: $total | Used: $used | Free: $avail"
}

# ============================================
# INSTALLATION FUNCTIONS
# ============================================

# Install Package
install_pkg() {
    if command -v $1 >/dev/null 2>&1 || dpkg -l 2>/dev/null | grep -q "^ii  $1"; then
        ok "$1 installed"
    else
        time_now "$(arrow "Installing $1...")"
        pkg install -y $1
        ok "$1 installed"
    fi
}

# Install Python Module
install_py() {
    if python3 -c "import $1" 2>/dev/null; then
        ok "$1 installed"
    else
        time_now "$(arrow "Installing $1...")"
        pip install $1 >/dev/null 2>&1
        ok "$1 installed"
    fi
}

# ============================================
# SHOW VERSION
# ============================================
show_version() {
    line
    star "SHERLOCK INFORMATION"
    line
    
    if command -v sherlock >/dev/null 2>&1; then
        local ver=$(pip show sherlock-project 2>/dev/null | grep "Version" | cut -d " " -f2)
        ok "Sherlock Version: $ver"
        ok "Installation: System (pip)"
    elif [[ -d "$SHERLOCK_DIR" ]]; then
        cd "$SHERLOCK_DIR"
        local ver=$(git describe --tags 2>/dev/null || echo "Latest")
        ok "Sherlock Version: $ver"
        ok "Installation: Git Repository"
        cd - >/dev/null
    else
        no "Sherlock not installed"
    fi
    
    line
}

# ============================================
# INSTALL SHERLOCK
# ============================================
install_sherlock() {
    echo
    star "INSTALLING SHERLOCK"
    line
    
    # Try pip first
    time_now "$(arrow "Installing via pip...")"
    if pip install sherlock-project
        ok "Sherlock installed successfully"
    else
        # Git backup
        warn "Pip failed, trying git..."
        
        if [[ -d "$SHERLOCK_DIR" ]]; then
            time_now "$(arrow "Updating repository...")"
            cd "$SHERLOCK_DIR" && git pull >/dev/null 2>&1
        else
            time_now "$(arrow "Cloning repository...")"
            git clone https://github.com/sherlock-project/sherlock.git "$SHERLOCK_DIR" >/dev/null 2>&1
        fi
        
        cd "$SHERLOCK_DIR"
        time_now "$(arrow "Installing requirements...")"
        pip install -r requirements.txt
        ok "Sherlock installed via git"
        cd - >/dev/null
    fi
    
    show_version
}

# ============================================
# REMOVE SHERLOCK - COMPLETE
# ============================================
remove_sherlock() {
    echo
    star "REMOVING SHERLOCK"
    line
    
    # Remove pip package
    if pip list | grep -q "sherlock-project"; then
        time_now "$(arrow "Removing pip package...")"
        pip uninstall sherlock-project -y >/dev/null 2>&1
        ok "Pip package removed"
    fi
    
    # Remove git repository
    if [[ -d "$SHERLOCK_DIR" ]]; then
        time_now "$(arrow "Removing git repository...")"
        rm -rf "$SHERLOCK_DIR"
        ok "Repository removed"
    fi
    
    # Optional modules removal
    warn "Remove numpy and pandas? (y/N): "
    read -r ans
    if [[ "$ans" =~ ^[Yy]$ ]]; then
        time_now "$(arrow "Removing modules...")"
        pip uninstall numpy pandas -y >/dev/null 2>&1
        ok "Modules removed"
    fi
    
    line
    ok "Sherlock completely uninstalled!"
    star "Created by: Sunil [Prince4you]"
}

# ============================================
# UPDATE SHERLOCK
# ============================================
update_sherlock() {
    echo
    star "UPDATING SHERLOCK"
    line
    
    if pip list | grep -q "sherlock-project"; then
        time_now "$(arrow "Updating pip package...")"
        pip install --upgrade sherlock-project
        ok "Sherlock updated"
    elif [[ -d "$SHERLOCK_DIR" ]]; then
        cd "$SHERLOCK_DIR"
        time_now "$(arrow "Updating repository...")"
        git pull >/dev/null 2>&1
        time_now "$(arrow "Updating requirements...")"
        pip install -r requirements.txt --upgrade
        ok "Sherlock updated"
        cd - >/dev/null
    else
        no "Sherlock not installed!"
        arrow "Install first: bash $0"
    fi
    
    show_version
}

# ============================================
# REPAIR SHERLOCK
# ============================================
repair_sherlock() {
    echo
    star "REPAIRING SHERLOCK"
    line
    
    if command -v sherlock >/dev/null 2>&1; then
        time_now "$(arrow "Reinstalling package...")"
        pip install --force-reinstall sherlock-project
    elif [[ -d "$SHERLOCK_DIR" ]]; then
        cd "$SHERLOCK_DIR"
        time_now "$(arrow "Reinstalling requirements...")"
        pip install --force-reinstall -r requirements.txt >/dev/null 2>&1
        cd - >/dev/null
    fi
    
    ok "Repair complete"
    show_version
}

# ============================================
# SHOW USAGE
# ============================================
show_usage() {
    clear
    echo
    star "HOW TO USE"
    line
    echo -e " ${C}→${NC} ${W}bash Sherlock-Installer.sh --help${NC}"
    echo -e " ${C}→${NC} ${W}sherlock username${NC}"
    echo -e " ${C}→${NC} ${W}sherlock --help${NC}"
    echo
    
    # Calculate time
    local end=$(date +%s)
    local dur=$((end - START_TIME))
    local min=$((dur / 60))
    local sec=$((dur % 60))
    
    info "Time taken: ${min}m ${sec}s"
    line
    star "Created by: Sunil [Prince4you]"
    star "Channel: Noob Cyber Tech"
    star "GitHub: Prince4you"
}

# ============================================
# HELP MENU
# ============================================
show_help() {
    clear
    show_banner
    echo -e "${W}Usage:${NC} bash $0 [option]"
    echo
    echo -e "${Y}Options:${NC}"
    echo -e "  ${C}install${NC}         Install Sherlock (default)"
    echo -e "  ${C}--update${NC}        Update Sherlock"
    echo -e "  ${C}--remove${NC}        Completely remove Sherlock"
    echo -e "  ${C}--repair${NC}        Repair installation"
    echo -e "  ${C}--version${NC}       Show Sherlock version"
    echo -e "  ${C}--help${NC}          Show this help"
    echo
    star "Created by: Sunil [Prince4you]"
}

# ============================================
# MAIN INSTALLATION
# ============================================
main_install() {
    show_banner
    
    # Basic checks
    check_termux
    check_internet
    check_storage
    
    echo
    star "INSTALLATION STARTED"
    line
    
    # Update termux
    time_now "$(info "Updating Termux...")"
    pkg update -y >/dev/null 2>&1
    
    # Install packages (only essentials)
    info "Installing packages..."
    install_pkg "python"
    install_pkg "git"
    install_pkg "build-essential"
    
    # Setup pip
    time_now "$(info "Setting up pip...")"
    pip install --upgrade pip 
    
    # Install Python modules
    info "Installing Python modules..."
    install_py "numpy"
    install_py "pandas"
    
    # Install Sherlock
    install_sherlock
    
    # Show usage
    show_usage
}

# ============================================
# COMMAND HANDLER
# ============================================
case $1 in
    -h|--help)
        show_help
        ;;
    --install|install|"")
        main_install
        ;;
    --update)
        show_banner
        check_internet
        update_sherlock
        ;;
    --remove)
        show_banner
        remove_sherlock
        ;;
    --repair)
        show_banner
        check_internet
        repair_sherlock
        ;;
    --version)
        show_banner
        show_version
        ;;
    *)
        show_banner
        no "Unknown option: $1"
        echo
        arrow "Use: bash $0 --help"
        ;;
esac

# ============================================
# END OF FRAMEWORK
# ============================================
