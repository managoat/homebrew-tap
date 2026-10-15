class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.28.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.28.0/managoat-darwin-arm64"
      sha256 "894b61890a7452d5298ca2d45b33c097661e7ba74171fd232a49b9c7bf7be12c"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.28.0/managoat-darwin-amd64"
      sha256 "83f0442ffa547aa00d2a37a3a24c7c005cc2e0d3944bd6f7b1332517067298ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.28.0/managoat-linux-arm64"
      sha256 "5d36b17e858c8c8df627f8ecba5e90f1d0177690c3f7e65ce8efa88ecf1832e6"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.28.0/managoat-linux-amd64"
      sha256 "4507735387ab40888b243825988fde06dd2426a1141f0f504e5551f9fce1a6e8"
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
