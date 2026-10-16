class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.6/managoat-darwin-arm64"
      sha256 "1c9bbc2673d4f5a260c32139d3ec82b8fd64f795705bc071d25bf8f926355de5"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.6/managoat-darwin-amd64"
      sha256 "5a4dac6a708f077911a48a9fe264578be75f9e5c7240cb431eabc0bf627c3397"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.6/managoat-linux-arm64"
      sha256 "c70616ef6e37e648af35238e1fd3dad335a9a826be03d703f6ca36a6d162b446"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.6/managoat-linux-amd64"
      sha256 "159037fe14d664248c05749d42c2bb62477beda2efdc09b9e370bd2b97bf9e61"
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
