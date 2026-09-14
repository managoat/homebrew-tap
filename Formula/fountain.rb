class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.17.0/fountain-darwin-arm64"
      sha256 "bdddfeccd4aa8390628db6dbaaed39646579138a19f4b1461e0c1f0e7318bbdd"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.17.0/fountain-darwin-amd64"
      sha256 "7cef9c66c652c467fd3327f81c9bf232cb7b6bcc8cd6a69305d96e78fa09aea7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.17.0/fountain-linux-arm64"
      sha256 "2b75623470f2b7fd08e586319d8c1c8623c21bb68a2a450650ca825b3ee72034"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.17.0/fountain-linux-amd64"
      sha256 "be659d215a468ddd92a9d7196a8ff894b6c3c2734e825fea26b8fc2c2bb6537b"
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
