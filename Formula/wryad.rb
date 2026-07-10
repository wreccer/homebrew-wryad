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
  version "0.0.15"

  on_macos do
    on_arm do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.15/wryad-aarch64-apple-darwin.tar.gz"
      sha256 "0743f1ff2634ceaaf413f21eb8183dbff08c73cfe4dda6abc2273664ab77cee4"
    end
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.15/wryad-x86_64-apple-darwin.tar.gz"
      sha256 "77f646f018946889948afc0d2913c306a3105a7be8ffdce440b2708a198fccfe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wreccer/wryad/releases/download/v0.0.15/wryad-x86_64-unknown-linux-musl.tar.gz"
      sha256 "11cfbadb37291459253424c225c323f9e19b81eb8d9bbdc2dee93c878b88dcb8"
    end
  end

  def install
    bin.install "wryad"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wryad --version")
  end
end