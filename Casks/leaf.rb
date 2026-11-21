cask "leaf" do
  version "0.1.1"
  sha256 "a0d1845acdd2d004672f17f08f61e75b8f7cf9757569ca1f30b22c903b2bc0cb"

  url "https://github.com/lucky72o/homebrew-tap/releases/download/leaf-#{version}/Leaf-#{version}.zip"
  name "Leaf"
  desc "Markdown reader with a review mode for Claude Code"
  homepage "https://github.com/lucky72o/homebrew-tap"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Leaf.app"

  # Leaf is not notarized yet, so with Homebrew's quarantine flag left on, Gatekeeper
  # refuses the first launch. Strip it from the staged copy, before the move into the
  # app directory: there macOS can refuse the change. A failure only costs the prompt.
  preflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{staged_path}}/Leaf.app"],
        must_succeed: false
  end

  uninstall quit: "com.slavhurmanau.leaf"

  zap trash: [
    "~/Library/Caches/com.slavhurmanau.leaf",
    "~/Library/Preferences/com.slavhurmanau.leaf.plist",
    "~/Library/WebKit/com.slavhurmanau.leaf",
  ]

  caveats <<~EOS
    On first launch Leaf offers to become the default app for .md files.

    For /leaf:read and /leaf:review in Claude Code, install the plugin:
      /plugin marketplace add lucky72o/leaf-plugin
      /plugin install leaf@leaf-plugin
  EOS
end
