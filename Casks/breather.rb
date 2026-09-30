cask "breather" do
  version "0.4.0"
  sha256 "2ab531a56f9c617cc514f109d6597f6da51d277da0969f35e67149dcc97fd972"

  url "https://github.com/M3tar/Breather/releases/download/v#{version}/Breather-#{version}.dmg"
  name "Breather"
  desc "Menu bar break reminder with full-screen rest scenes"
  homepage "https://github.com/M3tar/Breather"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Breather.app"

  uninstall quit: "com.mercury.breather"

  zap trash: "~/Library/Preferences/com.mercury.breather.plist"

  caveats <<~EOS
    Breather is not signed with an Apple Developer ID or notarized by Apple.
    macOS may block the first launch. Review the release and Apple's guidance:
      https://github.com/M3tar/Breather/releases/tag/v#{version}
      https://support.apple.com/guide/mac-help/open-a-mac-app-from-an-unknown-developer-mh40616/mac
  EOS
end
