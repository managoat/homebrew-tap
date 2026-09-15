class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.19.0/fountain-darwin-arm64"
      sha256 "d4ae0f4c5129eeb71908462bb14dd849c06fa63e29e5b7e104cda6bddcc9e467"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.19.0/fountain-darwin-amd64"
      sha256 "e76b4ca13faa99dfff8b23c42cb024f54c1c72da86249bea7f2ace2b2a022aad"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.19.0/fountain-linux-arm64"
      sha256 "e08395215dcb656d72175927bc7cbfc6d9c32a822654ba1dee002c4c24f6a856"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.19.0/fountain-linux-amd64"
      sha256 "320c06ce920093f20434c0d7a8e9255db2ac0d17e833d2f609fc3c2bbc2553ef"
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
