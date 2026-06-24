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
  version "0.0.10"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.10/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "23c77b1f9656cd9778228ef6b689cff126f9cfe36ba499cefe3163e01d009850"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.10/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "c9e388a34eac2bc179d70714d739c2fb340ac732d12b17b1933c7a3062372fae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.10/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "388828ebe4185a6d8e6bf7fb5b2837cf21b010172bab40d09ea6fa3053d044db"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end