# Clipboard

A Win+V style clipboard history for macOS. Press **⌘⇧V** anywhere to open your clipboard history, pick an item, and it gets pasted into the active app.

## Features

- Global hotkey **⌘⇧V**. The popup opens next to your text cursor, or next to the mouse if no cursor is found.
- Keeps text and images (screenshots included), up to 100 items. Pinned items are never trimmed.
- Search as you type, ↑↓ to select, ↵ or click to paste.
- **⌘1–9** quick paste, **⌘P** pin, **⌘⌫** delete, **esc** close. Rows also have a right-click menu.
- Skips anything password managers mark as concealed or transient.
- Lives in the menu bar only (no Dock icon), with an option to launch at login.

## Build & install

Needs macOS 13+ and the Xcode Command Line Tools (`xcode-select --install`).

```bash
./build.sh --install
```

This builds `build/Clipboard.app`, copies it to `/Applications` and launches it.

Then go to **System Settings → Privacy & Security → Accessibility** and turn on **Clipboard**. Auto-paste needs this permission; without it the chosen item is only copied, and you press ⌘V yourself. After a rebuild you may have to toggle the permission again, because the ad-hoc signature changes.

## Notes

- ⌘⇧V is taken over system-wide, so the "Paste and Match Style" shortcut in other apps won't work.
- Text is pasted back as plain text, without formatting.
- History is stored in `~/Library/Application Support/Clipboard/`.
