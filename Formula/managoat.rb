class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.32.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.32.0/managoat-darwin-arm64"
      sha256 "2a640a93dd57a6d50954fdd0fefd50ce66ed076c360ae07c02925da0f8577a2d"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.32.0/managoat-darwin-amd64"
      sha256 "1e9d748dd0a7bd2e1a8bf4763e9edd47368c06ca1a56b3f487f4f161ad07225e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.32.0/managoat-linux-arm64"
      sha256 "b3e2aaae9142057c6f351bf60dc28b3c32b2470e47c9eeda4feb1b3474f5f0bb"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.32.0/managoat-linux-amd64"
      sha256 "8117619cffd0567d6be24dd8a96505961fdaff7b190849804994680739d3effe"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "managoat-#{os}-#{arch}" => "managoat"
    bin.install_symlink bin/"managoat" => "fountain"
  end

  test do
    assert_match "managoat", shell_output("#{bin}/managoat --help")
  end
end
