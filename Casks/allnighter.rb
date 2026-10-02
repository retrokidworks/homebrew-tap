cask "allnighter" do
  version "0.1.7"
  sha256 "e1959803027d3def7372e8e37581cec323b323054f406b72a6e8400eb48cf1d3"

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
