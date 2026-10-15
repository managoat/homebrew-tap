class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.30.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.30.0/managoat-darwin-arm64"
      sha256 "18d0d451db61882c81cbe93d32377166b486cfcadad12abc50ec9f430b72b0a7"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.30.0/managoat-darwin-amd64"
      sha256 "f0bf67fa4764415788e78d03188d3fa8ff0a2e69e23c22d4994f3ffff273ae4b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.30.0/managoat-linux-arm64"
      sha256 "c60e8f6cbe06839c4eb5b7e1d07ca4d243a1ac3429c043ed99ec1d2e5f29af67"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.30.0/managoat-linux-amd64"
      sha256 "6043550c5e021a54425c5850810a2dbc52c6361e3d8f15061828463a9351a82d"
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
