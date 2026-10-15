class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.29.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.29.1/managoat-darwin-arm64"
      sha256 "2c6b1c7e35fcccebbd5224ef330a8e58a02a15632ba20d543302040e6cad98dc"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.29.1/managoat-darwin-amd64"
      sha256 "0a8b3d29c089881945a15cef3e0b64c5423c6a6d7e1077b4a5f6ad4be426605e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.29.1/managoat-linux-arm64"
      sha256 "267e4245bdfcaf3b220895009def8cd846517574456096927c4146d519e67afa"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.29.1/managoat-linux-amd64"
      sha256 "7aba87023f0a2a6e2e6b4864c5d3a8c3cad8dac4e157e4cd4a0169c4537b922f"
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
