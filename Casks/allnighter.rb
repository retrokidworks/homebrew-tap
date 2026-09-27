cask "allnighter" do
  version "0.1.4"
  sha256 "7f1ac7e8742fd95a3b8c76a9a3fff7fff5a4ab2a1a2d1d5ddf2d2b3e4ea8b27b"

  url "https://github.com/retrokidworks/allnighter/releases/download/v#{version}/Allnighter-#{version}.dmg"
  name "Allnighter"
  desc "Keep the computer awake with the display dimmed to black"
  homepage "https://github.com/retrokidworks/allnighter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Allnighter.app"

  uninstall launchctl: "com.retrokidworks.allnighter.helper",
            quit:      "com.retrokidworks.allnighter"

  zap trash: [
    "~/Library/Application Support/Allnighter",
    "~/Library/Preferences/com.retrokidworks.allnighter.plist",
  ]
end
