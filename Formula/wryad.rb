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
  version "0.0.13"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.13/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "9d06ea78f78562347e000adb16f394c755a6a76912e02d19aac96a2f974e7ae7"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.13/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "e1a84e2b7fb6be42996e26952e97018c413291c9e2418ff9c37a20c244856e04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.13/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2554133abc5020f662579ef065d3e64a45a95c75bc682be5d05df111727be50f"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end