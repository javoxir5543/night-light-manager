#!/bin/bash
echo "Installing Night Light Manager..."

mkdir -p ~/.scripts
cp scroll_kechki.sh ~/.scripts/
chmod +x ~/.scripts/scroll_kechki.sh

mkdir -p ~/.config/autostart
cp scroll_kechki_restore.desktop ~/.config/autostart/

echo "✅ Installation complete!"
echo "📌 Please set up hotkeys manually:"
echo "   Settings -> Keyboard -> Application Shortcuts"
echo "   Add: /home/$USER/.scripts/scroll_kechki.sh up  (choose any key, e.g., Ctrl+Shift+F7)"
echo "   Add: /home/$USER/.scripts/scroll_kechki.sh down (choose any key, e.g., Ctrl+Shift+F8)"
