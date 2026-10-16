class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.16"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.16/managoat-darwin-arm64"
      sha256 "5d7f58bde98aabea7654df477587616028b4d442266b84f02a4b08e6e5629fe6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.16/managoat-darwin-amd64"
      sha256 "b072617c93a1f22f41a01a7e59ca4738d46c21e98b79acc9616f414987c0ea8f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.16/managoat-linux-arm64"
      sha256 "493a0a45f759507ea004b05ddc92be8926e2e30add7c8056c199d1048331e7d8"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.16/managoat-linux-amd64"
      sha256 "acc959dd67aa42714c7cce9580561a09d22a4ee5da00782374c4f517c4ef98ef"
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
