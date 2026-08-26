#!/bin/bash
#
# Creates a new prototype directory with Slacky already wired up.
#
# Usage:
#   ./new-prototype.sh my-prototype-name
#   ./new-prototype.sh my-prototype-name /path/to/prototypes
#
# Creates:
#   <target>/my-prototype-name/
#   <target>/my-prototype-name/index.html    (ready to edit)
#   <target>/my-prototype-name/shared/slacky/ (copy of the library)

set -e

if [ -z "$1" ]; then
  echo "Usage: ./new-prototype.sh <prototype-name> [target-directory]"
  echo ""
  echo "Examples:"
  echo "  ./new-prototype.sh message-actions"
  echo "  ./new-prototype.sh message-actions ~/dev/prototypes"
  exit 1
fi

NAME="$1"
TARGET_DIR="${2:-.}"
PROTO_DIR="$TARGET_DIR/$NAME"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -d "$PROTO_DIR" ]; then
  echo "Error: $PROTO_DIR already exists."
  exit 1
fi

echo "Creating prototype: $NAME"

mkdir -p "$PROTO_DIR/shared"
cp -R "$SCRIPT_DIR" "$PROTO_DIR/shared/slacky"

# Remove git history and infrastructure files from the copy
rm -rf "$PROTO_DIR/shared/slacky/.git"
rm -f "$PROTO_DIR/shared/slacky/new-prototype.sh"
rm -f "$PROTO_DIR/shared/slacky/sync-slacky.sh"
rm -f "$PROTO_DIR/shared/slacky/check-slacky-updates.sh"
rm -f "$PROTO_DIR/shared/slacky/update-slacky.sh"
rm -rf "$PROTO_DIR/shared/slacky/.github"

# Copy starter template as the main file
cp "$SCRIPT_DIR/starter.html" "$PROTO_DIR/index.html"

# Update the title in the new file
sed -i '' "s/My Prototype/$NAME/" "$PROTO_DIR/index.html"

echo ""
echo "Done! Your prototype is at: $PROTO_DIR/"
echo ""
echo "To preview:"
echo "  cd $PROTO_DIR"
echo "  python3 -m http.server 8080"
echo "  Then open http://localhost:8080"
echo ""
echo "Open index.html in your editor to start building."
echo "See shared/slacky/showcase.html for component examples."
