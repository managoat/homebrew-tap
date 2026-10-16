class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.2/managoat-darwin-arm64"
      sha256 "52c2578604ffc3ae4b7f8e61c50a9934a20a74d7ab5ccbff926e4360bcd846c8"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.2/managoat-darwin-amd64"
      sha256 "4fe23e9ef0499fa64fe77462f065f155d87ddcbc930531f6bfc7b4de0ecfb4d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.2/managoat-linux-arm64"
      sha256 "0f9ab8ad09213fb02259ed61b7f62164b5270375a2c5e3d123a272ef6e2877be"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.2/managoat-linux-amd64"
      sha256 "c4fc16cf0dc6493805033b0f076a84a229812b7f091641b3410b06d34711486e"
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
