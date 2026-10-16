class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.20"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.20/managoat-darwin-arm64"
      sha256 "42f8e81f153a2ae59866c4e2af023fb018f414c0a1fb5ad3a8d333a414f88929"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.20/managoat-darwin-amd64"
      sha256 "654b44622282912ad9b9a0be084c73d519d7349bf7479fa011437e7e559eabc7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.20/managoat-linux-arm64"
      sha256 "7e746ec70ffd627dfd36441c3d2304d125549aed7f8eeac5daaef9832f4f318f"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.20/managoat-linux-amd64"
      sha256 "02650592f1c23870d645b367e4715312a3108390e31ab885232e632f916c64f8"
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
