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
  version "0.0.9"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.9/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "f870c463e9501a4bf36971abce74fb802ec1f7e9a5f40908ba2d196cccb44e99"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.9/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "cf6fe8c674f5517493de66af3f7f3c8b28f9150d7ca12b6298cbed8cbb1748a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.9/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4f14c887873e12c8ff6f44c77f3e54530b9fa0138a5f9527f03d49350ed0f80f"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end