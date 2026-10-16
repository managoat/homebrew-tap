class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.9"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.9/managoat-darwin-arm64"
      sha256 "25a1072403bdbe997f123c4fb3833a36f87b6d150d6fe7892ec930403eed9ea2"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.9/managoat-darwin-amd64"
      sha256 "5876502ca31addab568c5158e48b02ad9ae9b85ea372a6631eeba50fb0c3550d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.9/managoat-linux-arm64"
      sha256 "79b2904b6400430df030f11db1742c6e78ba026af6f4087de2ddd0219c248708"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.9/managoat-linux-amd64"
      sha256 "a1bc25edd05983c7827b7be645c98ceff2361da6e762e7c17407090fbc7fa96c"
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
