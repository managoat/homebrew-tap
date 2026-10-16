class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.21"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.21/managoat-darwin-arm64"
      sha256 "2db3a060a909ec1e3bfab9c04d831dc01aa9f5b0bfac014311623fd1e1998c1c"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.21/managoat-darwin-amd64"
      sha256 "9e88e9758a250c5160ddfb4c5d90f255e4211a7d8c3dac1eb7984a8783678ba8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.21/managoat-linux-arm64"
      sha256 "dc0611af381eda8e2bcbcc4d8fa5fa137da2687897f2d9c0aba668b577b45d10"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.21/managoat-linux-amd64"
      sha256 "ed95fa3c3e74be472388484a19748b3662969746a938332f9b6b79f89563e049"
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
