class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.18"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.18/managoat-darwin-arm64"
      sha256 "b8a3c5bf385b69fb065e80db874b22ea850179e0339be6f817e3ba447cf6e975"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.18/managoat-darwin-amd64"
      sha256 "4763f9d46b2fa5c3c6e44be530771e053b193ccd50fd5d386954bf70373550e4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.18/managoat-linux-arm64"
      sha256 "0cd0f0a3b78c3c87a963e92bc258bba65bf09dd52deb23ddc6e02f09a6330567"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.18/managoat-linux-amd64"
      sha256 "95d897ffe79ebe37c604cc77e1f0b3fb5b73f2986c1d0047cbd4d5fa5b074db7"
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
