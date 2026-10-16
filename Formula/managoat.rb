class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.4/managoat-darwin-arm64"
      sha256 "8f8c3507361f0d5c88e9e768a36f4f5a3931af835df5a7648b848f3084d55e56"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.4/managoat-darwin-amd64"
      sha256 "e898047791816ae8bb0a465632024c6acf2427ba1e8342d8b521b93dc4bd1b88"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.4/managoat-linux-arm64"
      sha256 "ba0c5c35b1c2de21c9e9c8a0a8baceeb372a9508fdec9c79f44e25d89adb6612"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.4/managoat-linux-amd64"
      sha256 "1de9c8e1af629bde71e44494670a593696825773bc8294ed5da2801f08bdf598"
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
