# RetroPie-Nointro-Full-Romsets

Download and extract No-Intro full romsets from loveroms (or other sites) to proper directories on RetroPie.

> **Note:** This is a work in progress!
> Also, this is a very large list of roms, you might not have enough space on your sd card.

## Usage

```bash
# Download all supported systems
./Romset-Downloader.sh

# Download specific systems
./Romset-Downloader.sh nes snes

# Force re-download (overwrites existing files)
./Romset-Downloader.sh --force c64

# List available systems
./Romset-Downloader.sh --list
```

## Requirements

- `wget` — downloading romsets
- `unrar` — extracting .rar archives
- `unzip` — extracting nested .zip archives

Install on RetroPie/Debian/Ubuntu:

```bash
sudo apt-get update && sudo apt-get install -y wget unrar unzip
```

## Current supported systems

| System | Status |
|--------|--------|
| Commodore 64 (All Regions) | ✅ Working |
| Game Boy (All Regions) | ✅ Working |
| Game Boy Advance (All Regions) | ⚠️ WIP — no download link |
| Game Boy Color (All Regions) | ✅ Working |
| Nintendo / NES (All Regions) | ✅ Working |
| Nintendo 64 (All Regions) | ⚠️ WIP — no download link |
| Sega 32X (All Regions) | ✅ Working |
| Sega Game Gear (All Regions) | ✅ Working |
| Sega Genesis / Mega Drive (All Regions) | ✅ Working |
| Sega Master System / Mark III (All Regions) | ✅ Working |
| Super Nintendo / SNES (All Regions) | ✅ Working |
| WonderSwan and Color (All Regions) | ✅ Working |

## How it works

1. Creates `~/RetroPie/roms/<system>/No-Intro/` directory
2. Downloads the No-Intro romset `.rar` from loveroms.com
3. Extracts the archive (handles nested `.zip` files)
4. Moves ROM files to `~/RetroPie/roms/<system>/`
5. Cleans up temporary archive files

## Options

| Option | Description |
|--------|-------------|
| `-h`, `--help` | Show help message |
| `-f`, `--force` | Force re-download even if files exist |
| `-l`, `--list` | List available systems |

## Environment variables

| Variable | Default | Description |
|----------|---------|-------------|
| `ROMSDIR` | `~/RetroPie/roms` | Base directory for ROM storage |

## 🎥 Gource Visualization

De ontwikkelhistorie van dit project in een film:

<video src="https://raw.githubusercontent.com/itsdarklikehell/RetroPie-Nointro-Full-Romsets/master/gource.mp4" controls width="100%"></video>
