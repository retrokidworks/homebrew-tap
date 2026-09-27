cask "allnighter" do
  version "0.1.5"
  sha256 "b0deeed4827521a2dabd413ab1bef308e35967004aa66f76a93d6f2a443239fb"

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
