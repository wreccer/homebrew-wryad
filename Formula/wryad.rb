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
  version "0.0.17"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.17/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "ea6f4d5c063fb48465a26ac4458f8e16ce2ba32f59f2663f9c646851707d0b92"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.17/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "acedd8e54019b4f2f79e5cae944990c82e9a95a712d7d3f10913c0100509afc9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.17/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "20da30c793a5e0c1b6e3aab56a74d7c5b7eb9de04a0be4505564a267bafcc7bb"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end