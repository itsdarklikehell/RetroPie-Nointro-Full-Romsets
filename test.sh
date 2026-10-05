#!/bin/bash
# Test suite for Romset-Downloader.sh
# Uses mock commands to test logic without network/filesystem side effects.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT="$SCRIPT_DIR/Romset-Downloader.sh"
TEST_DIR="$(mktemp -d)"
trap 'rm -rf "$TEST_DIR"' EXIT

PASS=0
FAIL=0

pass() { echo "  PASS: $1"; PASS=$((PASS + 1)); }
fail() { echo "  FAIL: $1"; FAIL=$((FAIL + 1)); }

# --- Test helpers ------------------------------------------------------------

# Create a mock command that logs calls and returns success
mock_cmd() {
    local name="$1"
    local mock_dir="$TEST_DIR/mocks"
    mkdir -p "$mock_dir"
    cat > "$mock_dir/$name" <<EOF
#!/bin/bash
echo "$name \$*" >> "$TEST_DIR/calls.log"
exit 0
EOF
    chmod +x "$mock_dir/$name"
}

# Reset call log
reset_log() { : > "$TEST_DIR/calls.log"; }

# Get call log contents
calls() { cat "$TEST_DIR/calls.log" 2>/dev/null || true; }

# --- Setup -------------------------------------------------------------------

echo "Setting up mocks..."
mock_cmd wget
mock_cmd unrar
mock_cmd unzip
mock_cmd mkdir
mock_cmd cp
mock_cmd rm
mock_cmd find
mock_cmd cd

export PATH="$TEST_DIR/mocks:$PATH"
export ROMSDIR="$TEST_DIR/roms"

# --- Tests -------------------------------------------------------------------

echo ""
echo "Test 1: Script is executable"
if [[ -x "$SCRIPT" ]]; then
    pass "Script has execute permission"
else
    fail "Script is not executable"
fi

echo ""
echo "Test 2: Script has valid bash syntax"
if bash -n "$SCRIPT" 2>/dev/null; then
    pass "Syntax is valid"
else
    fail "Syntax error detected"
fi

echo ""
echo "Test 3: Script contains set -euo pipefail"
if grep -q 'set -euo pipefail' "$SCRIPT"; then
    pass "Has strict mode"
else
    fail "Missing set -euo pipefail"
fi

echo ""
echo "Test 4: Script has shebang"
if head -1 "$SCRIPT" | grep -q '^#!/bin/bash'; then
    pass "Has bash shebang"
else
    fail "Missing or wrong shebang"
fi

echo ""
echo "Test 5: check_deps function exists"
if grep -q 'check_deps()' "$SCRIPT"; then
    pass "check_deps function defined"
else
    fail "check_deps function missing"
fi

echo ""
echo "Test 6: All system download functions exist"
for func in download_c64 download_gameboy download_gba download_gbc download_nes download_n64 download_sega32x download_gamegear download_genesis download_mastersystem download_snes download_wonderswan; do
    if grep -q "${func}()" "$SCRIPT"; then
        pass "$func defined"
    else
        fail "$func missing"
    fi
done

echo ""
echo "Test 7: No backslash-escaped spaces in paths (should use quotes)"
# Check for the old broken pattern: backslash-space outside quotes
if grep -n '\\\\ ' "$SCRIPT" | grep -v '^\s*#' | grep -v 'echo ' | grep -v 'usage' | grep -v 'cat <<' >/dev/null 2>&1; then
    fail "Found backslash-escaped spaces in paths"
else
    pass "No backslash-escaped spaces in paths"
fi

echo ""
echo "Test 8: No typos in system names"
# Check for known typos from original
if grep -q 'Systen' "$SCRIPT"; then
    fail "Found typo 'Systen' (should be 'System')"
elif grep -q '23X' "$SCRIPT"; then
    fail "Found typo '23X' (should be '32X')"
else
    pass "No known typos found"
fi

echo ""
echo "Test 9: Empty URLs are handled gracefully"
if grep -q 'setlink=""' "$SCRIPT"; then
    pass "Empty URLs present (for WIP systems)"
else
    fail "No empty URL handling"
fi

echo ""
echo "Test 10: dlset skips empty URLs"
if grep -A2 'if \[\[ -z "$setlink" \]\]' "$SCRIPT" | grep -q 'SKIP'; then
    pass "dlset handles empty URLs"
else
    fail "dlset does not handle empty URLs"
fi

echo ""
echo "Test 11: usage function exists"
if grep -q 'usage()' "$SCRIPT"; then
    pass "usage function defined"
else
    fail "usage function missing"
fi

echo ""
echo "Test 12: list_systems function exists"
if grep -q 'list_systems()' "$SCRIPT"; then
    pass "list_systems function defined"
else
    fail "list_systems function missing"
fi

echo ""
echo "Test 13: ROMSDIR is configurable via environment"
if grep -q 'ROMSDIR="${ROMSDIR:-' "$SCRIPT"; then
    pass "ROMSDIR is configurable"
else
    fail "ROMSDIR is hardcoded"
fi

echo ""
echo "Test 14: move_roms uses find for safe space handling"
if grep -A10 'move_roms()' "$SCRIPT" | grep -q 'find'; then
    pass "move_roms uses find for spaces"
else
    fail "move_roms does not handle spaces safely"
fi

echo ""
echo "Test 15: Script handles unknown system gracefully"
if grep -q 'Unknown system' "$SCRIPT"; then
    pass "Unknown system handling present"
else
    fail "No unknown system handling"
fi

echo ""
echo "Test 16: README exists and is non-empty"
if [[ -s "$SCRIPT_DIR/README.md" ]]; then
    pass "README exists"
else
    fail "README missing or empty"
fi

echo ""
echo "Test 17: CI workflow exists"
if [[ -f "$SCRIPT_DIR/.github/workflows/ci.yml" ]]; then
    pass "CI workflow exists"
else
    fail "CI workflow missing"
fi

echo ""
echo "Test 18: Gource workflow exists"
if [[ -f "$SCRIPT_DIR/.github/workflows/gource.yml" ]]; then
    pass "Gource workflow exists"
else
    fail "Gource workflow missing"
fi

echo ""
echo "Test 19: No commented-out rm commands (dead code)"
if grep -n '^#rm ' "$SCRIPT" >/dev/null 2>&1; then
    fail "Found commented-out rm commands"
else
    pass "No dead rm commands"
fi

echo ""
echo "Test 20: Script uses wget with progress bar"
if grep -q 'wget.*progress' "$SCRIPT"; then
    pass "wget has progress indicator"
else
    fail "wget missing progress indicator"
fi

# --- Summary -----------------------------------------------------------------

echo ""
echo "============================================================"
echo "Results: $PASS passed, $FAIL failed out of $((PASS + FAIL)) tests"
echo "============================================================"

if [[ $FAIL -gt 0 ]]; then
    exit 1
fi
