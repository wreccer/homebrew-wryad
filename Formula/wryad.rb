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
  version "0.0.14"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.14/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "f9cad05bf7857dca3df5d717030d523cce8caaca0b23bff2ef1c6e815df94c5f"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.14/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "ad32f44520150a532e24051413d24f45aaeaa82e99170c0139152bb52ed7befd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.14/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5b8a69f519192b64087859bc1cfdbbb4a0d00cdd0489df1bdd6854572f0fdb39"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end