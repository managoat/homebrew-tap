class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.3/managoat-darwin-arm64"
      sha256 "b488aca6890c22da1bc38dd07e105fd55a8f5663da7d6cebf7f12175493aaea6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.3/managoat-darwin-amd64"
      sha256 "7f3be76f1602e9cfbb8acb24f02c29309b2a4168febd947479207810075d7f6f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.3/managoat-linux-arm64"
      sha256 "33f9501b49cad9699d4ff5fbda960d33c56b309b6b96733266292602288db11b"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.3/managoat-linux-amd64"
      sha256 "7ac0a4144680c7be05b412f0815b5f6815ab67f583f24d74719317ebb77a5808"
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
