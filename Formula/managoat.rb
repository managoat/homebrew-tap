class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.39.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.39.1/managoat-darwin-arm64"
      sha256 "cec53dca3b2a52ba5648c51a2c358408dbb2b5de3e17d1ac4ba5e1159c301a96"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.39.1/managoat-darwin-amd64"
      sha256 "2f08ce0f28d47863d565e6770d15133585bffb3455587cc5e7ef16240b1ec716"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.39.1/managoat-linux-arm64"
      sha256 "19042d73736a581e05be2f272ac992a9282caca235ac42b1315789e020d460e3"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.39.1/managoat-linux-amd64"
      sha256 "3e575f0d2dd72f626095bcd72bc762c6e2846a8554349e9434f256a6693205c1"
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
