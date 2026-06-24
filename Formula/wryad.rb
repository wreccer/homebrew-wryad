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
  version "0.0.12"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.12/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "5a5bba2538ed754108134d976859600a932c8b3fbffd479131d180d223d21401"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.12/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "e70e6cecca275ea80a3f81e77fcd312d6bab68c1c52fa39f0a234577a5beab57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.12/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8dd37666e48f901f141f8f0f892e64f8943dbbc7a3f812a02087e31d7b5ed978"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end