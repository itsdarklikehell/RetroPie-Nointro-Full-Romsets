#!/bin/bash
set -euo pipefail

# =============================================================================
# RetroPie No-Intro Full Romset Downloader
# Downloads and extracts No-Intro romsets to ~/RetroPie/roms/<system>/No-Intro
# =============================================================================

ROMSDIR="${ROMSDIR:-$HOME/RetroPie/roms}"

# --- Dependency check --------------------------------------------------------
check_deps() {
    local missing=()
    for cmd in wget unrar unzip; do
        if ! command -v "$cmd" &>/dev/null; then
            missing+=("$cmd")
        fi
    done
    if [[ ${#missing[@]} -gt 0 ]]; then
        echo "ERROR: Missing required commands: ${missing[*]}" >&2
        echo "Install them with: sudo apt-get install wget unrar unzip" >&2
        exit 1
    fi
}

# --- Banner ------------------------------------------------------------------
banner() {
    echo "============================================================"
    echo "RetroPie No-Intro Romset Downloader"
    echo "Target: $ROMSDIR/<system>/No-Intro"
    echo "============================================================"
}

# --- Core functions ----------------------------------------------------------
makedirs() {
    local setname="$1"
    local target="$ROMSDIR/$setname/No-Intro"
    echo "Creating directory: $target"
    mkdir -p "$target"
}

dlset() {
    local setname="$1"
    local setlink="$2"
    local target="$ROMSDIR/$setname/No-Intro/$setname.rar"

    if [[ -z "$setlink" ]]; then
        echo "SKIP: No download link configured for $setname"
        return 0
    fi

    if [[ -f "$target" ]]; then
        echo "SKIP: $setname.rar already exists (use -f to force re-download)"
        return 0
    fi

    echo "Downloading $setname from $setlink"
    wget -c --progress=bar:force "$setlink" -O "$target"
}

extract() {
    local setname="$1"
    local target="$ROMSDIR/$setname/No-Intro"
    local rarfile="$target/$setname.rar"

    if [[ ! -f "$rarfile" ]]; then
        echo "SKIP: $setname.rar not found, cannot extract"
        return 0
    fi

    echo "Extracting $setname.rar to $target"
    cd "$target"
    unrar x -y "$rarfile" "$target"

    # Extract any nested zip files
    local zips
    zips=$(find "$target" -maxdepth 1 -name "*.zip" -print -quit)
    if [[ -n "$zips" ]]; then
        echo "Extracting nested zip files..."
        unzip -o "$target"/*.zip -d "$target" || true
    fi

    cd - >/dev/null
}

cleanup() {
    local setname="$1"
    local target="$ROMSDIR/$setname/No-Intro"
    echo "Cleaning up $setname..."
    rm -f "$target/$setname.rar"
    rm -f "$target"/*.zip
}

move_roms() {
    local setname="$1"
    local src_pattern="$2"
    local dest="$ROMSDIR/$setname"

    echo "Moving ROM files for $setname..."
    # Use find to handle spaces safely
    local src_dir
    src_dir=$(find "$ROMSDIR/$setname/No-Intro" -maxdepth 1 -type d -name "$src_pattern" -print -quit)
    if [[ -n "$src_dir" ]]; then
        cp -r "$src_dir"/* "$dest"/ 2>/dev/null || true
        echo "Moved ROMs from $src_dir to $dest"
    else
        echo "WARN: Could not find source directory matching '$src_pattern' for $setname"
    fi
}

# --- System download functions ------------------------------------------------
download_c64() {
    local setname="c64"
    local setlink="https://download.loveroms.com/roms/sets/Commodore%20-%2064.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Commodore - 64"
    cleanup "$setname"
}

download_gameboy() {
    local setname="gameboy"
    local setlink="https://download.loveroms.com/roms/sets/Nintendo%20-%20Game%20Boy.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Nintendo - Game Boy"
    cleanup "$setname"
}

download_gba() {
    local setname="gba"
    local setlink=""
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Nintendo - Game Boy Advance"
    cleanup "$setname"
}

download_gbc() {
    local setname="gbc"
    local setlink="https://download.loveroms.com/roms/sets/Nintendo%20-%20Game%20Boy%20Color.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Nintendo - Game Boy Color"
    cleanup "$setname"
}

download_nes() {
    local setname="nes"
    local setlink="https://download.loveroms.com/roms/sets/Nintendo%20-%20Nintendo%20Entertainment%20System.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Nintendo - Nintendo Entertainment System"
    cleanup "$setname"
}

download_n64() {
    local setname="n64"
    local setlink=""
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Nintendo - Nintendo 64"
    cleanup "$setname"
}

download_sega32x() {
    local setname="sega32x"
    local setlink="https://download.loveroms.com/roms/sets/Sega%20-%2032X.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Sega - 32X"
    cleanup "$setname"
}

download_gamegear() {
    local setname="gamegear"
    local setlink="https://download.loveroms.com/roms/sets/Sega%20-%20Game%20Gear.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Sega - Game Gear"
    cleanup "$setname"
}

download_genesis() {
    local setname="genesis"
    local setlink="https://download.loveroms.com/roms/sets/Sega%20-%20Mega%20Drive%20-%20Genesis.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Sega - Mega Drive - Genesis"
    cleanup "$setname"
}

download_mastersystem() {
    local setname="mastersystem"
    local setlink="https://download.loveroms.com/roms/sets/Sega%20-%20Master%20System%20-%20Mark%20III.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Sega - Master System - Mark III"
    cleanup "$setname"
}

download_snes() {
    local setname="snes"
    local setlink="https://download.loveroms.com/roms/sets/Nintendo%20-%20Super%20Nintendo%20Entertainment%20System.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Nintendo - Super Nintendo Entertainment System"
    cleanup "$setname"
}

download_wonderswan() {
    local setname="wonderswan"
    local setlink="https://download.loveroms.com/roms/sets/Bandai%20-%20WonderSwan%20and%20Color.rar"
    makedirs "$setname"
    dlset "$setname" "$setlink"
    extract "$setname"
    move_roms "$setname" "Bandai - WonderSwan and Color"
    cleanup "$setname"
}

# --- Usage -------------------------------------------------------------------
usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS] [SYSTEM...]

Options:
  -h, --help      Show this help message
  -f, --force     Force re-download even if files exist
  -l, --list      List available systems

Systems:
  c64             Commodore 64
  gameboy         Game Boy
  gba             Game Boy Advance (WIP - no link)
  gbc             Game Boy Color
  nes             Nintendo Entertainment System
  n64             Nintendo 64 (WIP - no link)
  sega32x         Sega 32X
  gamegear        Sega Game Gear
  genesis         Sega Genesis / Mega Drive
  mastersystem    Sega Master System / Mark III
  snes            Super Nintendo
  wonderswan      WonderSwan and Color
  all             Download all systems (default)

Examples:
  $(basename "$0") nes snes          # Download only NES and SNES
  $(basename "$0") --force c64      # Force re-download C64
  $(basename "$0") --list            # List available systems
EOF
}

list_systems() {
    echo "Available systems:"
    echo "  c64          Commodore 64"
    echo "  gameboy      Game Boy"
    echo "  gba          Game Boy Advance (WIP - no link)"
    echo "  gbc          Game Boy Color"
    echo "  nes          Nintendo Entertainment System"
    echo "  n64          Nintendo 64 (WIP - no link)"
    echo "  sega32x      Sega 32X"
    echo "  gamegear     Sega Game Gear"
    echo "  genesis      Sega Genesis / Mega Drive"
    echo "  mastersystem Sega Master System / Mark III"
    echo "  snes         Super Nintendo"
    echo "  wonderswan   WonderSwan and Color"
}

# --- Main --------------------------------------------------------------------
main() {
    local force=false
    local systems=()

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -h|--help)
                usage
                exit 0
                ;;
            -f|--force)
                force=true
                shift
                ;;
            -l|--list)
                list_systems
                exit 0
                ;;
            -*)
                echo "Unknown option: $1" >&2
                usage
                exit 1
                ;;
            *)
                systems+=("$1")
                shift
                ;;
        esac
    done

    # Default: all systems
    if [[ ${#systems[@]} -eq 0 ]]; then
        systems=(c64 gameboy gbc nes sega32x gamegear genesis mastersystem snes wonderswan)
    fi

    check_deps
    banner

    for sys in "${systems[@]}"; do
        case "$sys" in
            c64)          download_c64 ;;
            gameboy)      download_gameboy ;;
            gba)          download_gba ;;
            gbc)          download_gbc ;;
            nes)          download_nes ;;
            n64)          download_n64 ;;
            sega32x)      download_sega32x ;;
            gamegear)     download_gamegear ;;
            genesis)      download_genesis ;;
            mastersystem) download_mastersystem ;;
            snes)         download_snes ;;
            wonderswan)   download_wonderswan ;;
            all)
                download_c64
                download_gameboy
                download_gbc
                download_nes
                download_sega32x
                download_gamegear
                download_genesis
                download_mastersystem
                download_snes
                download_wonderswan
                ;;
            *)
                echo "Unknown system: $sys" >&2
                echo "Use --list to see available systems" >&2
                exit 1
                ;;
        esac
    done

    echo ""
    echo "============================================================"
    echo "Done! ROMs are in $ROMSDIR/<system>/"
    echo "============================================================"
}

main "$@"
