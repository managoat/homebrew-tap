class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.36.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.36.0/managoat-darwin-arm64"
      sha256 "6b30c35a6ffd2108c0605b029a52fdc068a0b05347ea02767734ce98c21d3063"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.36.0/managoat-darwin-amd64"
      sha256 "12c4fd046296859427e2cd1ab1d9cd688757f759fc2395b79ab7cd5fa68de39d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.36.0/managoat-linux-arm64"
      sha256 "1a686a7b6f60a1d70e412cbbdd25e1dad8dcbce2027dd9c116e6dd3825b648cf"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.36.0/managoat-linux-amd64"
      sha256 "0dba93bdb947bf2d368da57813d40fb79787ff9e5834937d03e0e4127ae067df"
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
