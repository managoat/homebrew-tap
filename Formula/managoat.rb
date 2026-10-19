class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.37.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.37.1/managoat-darwin-arm64"
      sha256 "ee04dfe8234280526a39bede6ee283f7e00c3a58f2b59672f492c37389b28704"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.37.1/managoat-darwin-amd64"
      sha256 "2a7cb4efa96cdb622813a0f269b5007006ced31adfd2b61fd8cd0724cd571412"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.37.1/managoat-linux-arm64"
      sha256 "ec8d05ecb76972014acb8cac8300e6859186d1a262d5508429ebf8915e0b3b37"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.37.1/managoat-linux-amd64"
      sha256 "a6214c10c814f3a7479f8206fabf319c4a1ae9de98287cc5b8301e8227ba2e53"
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
