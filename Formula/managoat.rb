class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.12"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.12/managoat-darwin-arm64"
      sha256 "cf704a59010003e78f1b222ae00444a785b905ae6f11f29805b68a0bbacdc946"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.12/managoat-darwin-amd64"
      sha256 "044e9c9b1a22ce922f591055b1fe22deab46c933e1028f74cd95b0b9320421f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.12/managoat-linux-arm64"
      sha256 "f7454cb60bc776d3c45c1786e2dd2a645e3ff818bd943c7061236a3f9a48f865"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.12/managoat-linux-amd64"
      sha256 "860ab17af4babb072810d11f3e4538abbd4adbe8e18a7ce2d62d805e3b56c5ac"
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
