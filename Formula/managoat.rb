class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.0/managoat-darwin-arm64"
      sha256 "e26a09b2e1badb94e8bb56ff80f386719e343ace4d9c3b14844bd05950aba027"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.0/managoat-darwin-amd64"
      sha256 "547acd90605e93b4d6d3546de946d17a4af13f8eb912403c1bfc33af070899c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.0/managoat-linux-arm64"
      sha256 "54b9d84fa5d7170b10d2c848b411fd6cbc62e8c1d25908c2b19f78050c049b30"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.0/managoat-linux-amd64"
      sha256 "8d2bc4626f649ef8f32b945d1115c2598df9fb8560964f7830cbc689be2a0a69"
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
