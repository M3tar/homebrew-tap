# M3tar Homebrew tap

Homebrew tap for M3tar's macOS apps.

Install [Breather](https://github.com/M3tar/Breather), a macOS menu bar break reminder, using Homebrew.

## Requirements

- [Homebrew](https://brew.sh)
- macOS 15 (Sequoia) or later
- Apple silicon or Intel Mac; both use the same universal DMG

## Install

```sh
brew install --cask M3tar/tap/breather
```

Homebrew adds this tap automatically. Alternatively:

```sh
brew tap M3tar/tap
brew install --cask breather
```

Open **Breather** from Applications after installation. The cask downloads the original release DMG directly from `M3tar/Breather` and checks its pinned SHA-256.

If you already installed Breather manually, quit it and move the existing `Breather.app` out of Applications before installing with Homebrew. Keep a backup until the Homebrew installation succeeds. Moving the app does not remove your preferences.

### First launch and security

The current release is **not signed with an Apple Developer ID or notarized by Apple**, so macOS may block it. Review the [release notes](https://github.com/M3tar/Breather/releases/tag/v0.4.0) and [Apple's guidance for apps from unknown developers](https://support.apple.com/guide/mac-help/open-a-mac-app-from-an-unknown-developer-mh40616/mac) before deciding whether to open it. This tap preserves Homebrew's normal quarantine and macOS security checks.

## Update

```sh
brew update
brew upgrade --cask M3tar/tap/breather
```

Updates become available through Homebrew after this tap's cask is updated. Breather's built-in update checker opens GitHub Releases; it does not install updates automatically. For an installation managed by Homebrew, use the commands above.

## Uninstall

Turn off **Launch at Login** in Breather's settings if enabled, then:

```sh
brew uninstall --cask M3tar/tap/breather
```

Normal uninstall preserves preferences. To also move Breather's saved preferences to Trash:

```sh
brew uninstall --cask --zap M3tar/tap/breather
```

Remove the tap if you no longer use any of its casks:

```sh
brew untap M3tar/tap
```

## Maintaining the cask

The cask is pinned to a version and checksum. After publishing a new release in [M3tar/Breather](https://github.com/M3tar/Breather/releases):

1. Download its DMG and run `shasum -a 256 Breather-VERSION.dmg`. Compare the result with the release's checksum and GitHub asset digest.
2. Update `version` and `sha256` in `Casks/breather.rb`. If the asset name, app bundle, supported architectures, or minimum macOS changed, update those fields too.
3. On a supported Mac with Homebrew, validate the cask before committing:

   ```sh
   brew style --cask M3tar/tap/breather
   brew audit --cask --online M3tar/tap/breather
   brew livecheck --cask M3tar/tap/breather
   brew fetch --cask M3tar/tap/breather
   ```

4. Test installation, upgrade, and uninstall on a suitable Mac. The current unsigned release may produce security-related audit findings; do not suppress macOS protections to make a check pass.
5. Commit and push the updated cask. `livecheck` reports upstream versions; it does not edit or publish this tap automatically.

See the [Homebrew Cask Cookbook](https://docs.brew.sh/Cask-Cookbook) and [tap maintenance guide](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap).

## Issues and licensing

Report app issues in [M3tar/Breather](https://github.com/M3tar/Breather/issues) and installation-definition issues in [this tap](https://github.com/M3tar/homebrew-tap/issues).

This tap references upstream release downloads and does not repackage the app. Breather's source and bundled third-party assets have different license terms; see the [upstream licensing notes](https://github.com/M3tar/Breather#license).
