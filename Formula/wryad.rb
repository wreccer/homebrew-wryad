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
  version "0.0.21"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.21/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "21c084ece7ceb209222834d7d853799c8aa57d4bc4fce0daa252157d39fb5d76"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.21/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "fda10a59ff288f39ab0ad5e4f46a8eab12f692f5266d3880e7182207d88cb50e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.21/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0be6e5bd1703d9934a565b8e2de8579b7833ec233615530d6bd34f3f7453f773"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end