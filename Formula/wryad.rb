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
  version "0.0.11"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.11/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "1b437254de43422a21dac49366a5f9ac97844d3e319e93132bf0d9ba55a38dd4"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.11/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "f1c2e5f8a312a6dbda8a0ac8a8e10274aca371c4268fcd6b11a09dd60d7d8c21"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.11/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0cdd1cb95d736409f25aa7e0767818db73c2e4ab28ba915191a64eaeefcb6434"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end