class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.22.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.22.1/fountain-darwin-arm64"
      sha256 "c9b70aef953916456693689a57b827d7f2f6aaf6cd7a22b90072faecb19308fe"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.22.1/fountain-darwin-amd64"
      sha256 "9e5dbc94e5b4bfc59df79f041752d5e67f1827f2112a46fecf70ef8b84fdd661"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.22.1/fountain-linux-arm64"
      sha256 "08f833e009aa75ad3a49a4bc14fe7509a0be58174031397627bff196f4d88b77"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.22.1/fountain-linux-amd64"
      sha256 "d408684bd34afc9c9807f2c88228214c4f1de812febfee7267110014dc165d73"
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
