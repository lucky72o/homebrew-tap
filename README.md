# homebrew-tap

Homebrew casks for [Leaf](https://github.com/lucky72o/leaf-plugin), a small native Mac app for
reading markdown, with a review mode for Claude Code.

## Install

Apple silicon Mac, macOS 14 or later:

```bash
brew install --cask lucky72o/tap/leaf
```

On first launch Leaf offers to become the default app for `.md` files.

For `/leaf:read` and `/leaf:review` in Claude Code, install the plugin:

```
/plugin marketplace add lucky72o/leaf-plugin
/plugin install leaf@leaf-plugin
```

Update with `brew upgrade`, remove with `brew uninstall --cask leaf`.

Leaf is not notarized by Apple yet. The cask removes the quarantine flag so the app opens
without a Gatekeeper warning.
