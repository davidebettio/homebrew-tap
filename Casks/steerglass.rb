cask "steerglass" do
  version "0.2.5"
  sha256 "735f76e00e1fab2fc07332576b712060c47357ac0f2874aabf551a92be426005"

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
