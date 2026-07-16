# typed: false
# frozen_string_literal: true

# Homebrew formula for wryad (rendered on each `v*` tag by release CI).
#
# Requires public release assets — install via this tap only after a public
# engine mirror exists. While wreccer/wryad is private, use scripts/install.sh
# or examples/consumer/scripts/install-wryad.sh with `gh auth login`.
class Wryad < Formula
  desc "Wryad Automation Engine — harness CLI and Workshop team builder"
  homepage "https://github.com/wreccer/wryad"
  version "0.0.18"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.18/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "c1dcd3b3b45eb1fe2fb9ef2a46df3a06412f5e9ed0f29b5c211f40dde3290970"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.18/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "0dcd8b79fc198d7601a9c3f2e374514c6e7336cdd9b25b753ca6c8a8a812dbb6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.18/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "052d5b6b5b00e50f8166a4a51d93d2707f54b1b4f45c8fe483875943c9a861f3"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end