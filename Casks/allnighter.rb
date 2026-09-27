cask "allnighter" do
  version "0.1.0"
  sha256 "9f82081b67333a043d480f9a61035d04b7db0024cbb1f5ae0fc8ae193598b326"

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
