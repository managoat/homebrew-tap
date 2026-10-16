class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.15"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.15/managoat-darwin-arm64"
      sha256 "6e77dc97e6b29510230c95bae3d4ffebba7a2974073f0b745969b2f5cb48d2c3"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.15/managoat-darwin-amd64"
      sha256 "86c05940aad452d8aa3337c55a8093a7ac1437a119cf65c9d010d33fc1e699d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.15/managoat-linux-arm64"
      sha256 "8794a59baa8e35b41c5ba3355fb85d137c2b35833b3b635d786d8b678345cb44"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.15/managoat-linux-amd64"
      sha256 "7c3290ee2c6995bab64e3262ab87fff948b73cd7fa94d6344ef8f8f63b077ae4"
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
