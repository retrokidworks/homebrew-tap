cask "allnighter" do
  version "0.1.2"
  sha256 "61c334afaecea9554c0681f28e5c058db2d9f412e55679bf733a532ea14db838"

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
