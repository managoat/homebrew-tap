class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.8"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.8/managoat-darwin-arm64"
      sha256 "d32b1c5c1021d5bf738b6d8da0fa9fbd212e9e8a57104114c63400ff217f5f5f"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.8/managoat-darwin-amd64"
      sha256 "ed0b8f7c383653a1d62d50ece1ac818a8af1f5cd2b3a1c80ac6378bf87fca5aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.8/managoat-linux-arm64"
      sha256 "a9c76d7cc9613f0be1236fbfc4b03fc303dc4cd8479c85f04ad9215e170f965f"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.8/managoat-linux-amd64"
      sha256 "c074c784ae4c02711a16eed945d884582b8c10e82f0ff116a988c0a213b10131"
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
