class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.13"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.13/managoat-darwin-arm64"
      sha256 "af9a2e96b9335ffd725ce89c7fed705a51b2f240f759892f00c158a6cc1f2782"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.13/managoat-darwin-amd64"
      sha256 "0a5a560e233450847cb2d690e219d99d67c4b0a197f73ed62048cd92c5f2012c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.13/managoat-linux-arm64"
      sha256 "047afdef0e47be3842edd4eabfc45c60cf676348f7ea20e4700814648c32732f"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.13/managoat-linux-amd64"
      sha256 "3e13f6ce0e899a3015af6f0badc3a8bc6221f07e9d8eda12d88a11c0d57fb841"
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
