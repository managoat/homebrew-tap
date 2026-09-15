class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.18.0/fountain-darwin-arm64"
      sha256 "4fcc57a4caa2242e4e591024ac35985fec4e90ba89cfaa389bc1c46205caa334"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.18.0/fountain-darwin-amd64"
      sha256 "5aacf053111622040a604e0bdc3d34b186a85e6bd8ece8de4b3f7f3ca11ce0ea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.18.0/fountain-linux-arm64"
      sha256 "57a41a0121d2d65081ca03cebc78e2795292f8ec7948126f620c95dd7d953109"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.18.0/fountain-linux-amd64"
      sha256 "2bdec3bdeed85c5cff999263d1864c0e1fab04d99818ab6c8e33e589b5771bb5"
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
