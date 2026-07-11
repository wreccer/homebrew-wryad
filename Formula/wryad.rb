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
  version "0.0.16"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.16/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "0edc9ba5670cdbd4fb24dc26cd814a2fcb4f8eb3c165ad91165d97e79ed1e337"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.16/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "d83bab0dea4915ed818c722bf5b2ba2353cf3cb273cd199172ff01a6076ad3bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.16/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f1225352e5d3683ecf205029f7f27a08cfd48e458c3951757cf04184295bc6b1"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end