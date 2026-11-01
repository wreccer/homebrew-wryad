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
  version "0.0.32"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.32/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "894e1991e87a474380005a33c53a9a20cd1d5d77fe82fce2c2bea31ecaed9e33"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.32/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "b221adaf5790c096f7616a2bb9a2f5554ded876adc3026205d760168f0f9fcbd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.32/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c9802424ac3ea2c4ad77b6933c6e131494bfa1debd7e2cb136eecfffe8fe607b"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end