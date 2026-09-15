class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.17.1/fountain-darwin-arm64"
      sha256 "235e3fc92e01bf95ab830e0d98c5d5aebbf9b5059debd1944e3a9600ade690ba"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.17.1/fountain-darwin-amd64"
      sha256 "f705a9478aea57cf8855376416ef4f8b0b8851d2c6774a14954e15e1d6f48ec3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.17.1/fountain-linux-arm64"
      sha256 "2594eca09908c2c8ab4c80611531740ab147292aed8eb3a03a6aec1c8e2b5ba4"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.17.1/fountain-linux-amd64"
      sha256 "9d29d73e2181884c6a3742d754acf8906cf55dc7ecaadf1389c7ecbaad14917e"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "fountain-#{os}-#{arch}" => "fountain"
  end

  test do
    assert_match "fountain", shell_output("#{bin}/fountain --help")
  end
end
