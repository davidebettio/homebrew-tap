cask "steerglass" do
  version "0.2.8"
  sha256 "4a68089858793b0224f3bab5792a595a96d6d203ab37b2bc39b6d01491d7ca1e"

  url "https://steerglass.com/releases/#{version}/steerglass_#{version}_universal.dmg"
  name "Steerglass"
  desc "Fast desktop client for many Kubernetes clusters"
  homepage "https://steerglass.com/"

  livecheck do
    url "https://steerglass.com/updates/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Steerglass.app"

  zap trash: [
    "~/Library/Application Support/com.steerglass.app",
    "~/Library/Caches/com.steerglass.app",
    "~/Library/Saved Application State/com.steerglass.app.savedState",
    "~/Library/WebKit/com.steerglass.app",
  ]
end
