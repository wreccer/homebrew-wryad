# typed: false
# frozen_string_literal: true

# Homebrew formula for wryad.
#
# This file is a TEMPLATE. The `release.yml` workflow renders it into a concrete
# `wryad.rb` on each `v*` tag, substituting the placeholders below with the
# release version and the sha256 of each uploaded `wryad-<target>.tar.gz` asset.
# Placeholders are wrapped in double underscores so the rendered file is never
# accidentally published with stubs left in (the generator asserts none remain).
#
# Rendered output is published to the wreccer/homebrew-wryad repo so users can:
#   brew tap wreccer/wryad && brew install wryad
class Wryad < Formula
  desc "Wryad Automation Engine — harness CLI and Workshop team builder"
  homepage "https://github.com/wreccer/wryad"
  version "0.0.7"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.7/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "2d874ebee6cc058e843131225184a27c1d35d5683a240c9a2f3e6e3652d9b755"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.7/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "e73329984f703a6e58d4644acd347cf5a3fcc0ac0419704c18aa5a36e55fcce4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.7/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "281a8e7920da590ec18c1b1a80e120cbe8586a4c261a9ef667bff8a79ed4c9e9"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end