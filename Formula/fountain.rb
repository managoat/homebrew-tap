class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.25.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.25.0/fountain-darwin-arm64"
      sha256 "398cd46f4c1765c2cadbceeeb13fc6242c66343442d2640974a05bdcdc373a14"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.25.0/fountain-darwin-amd64"
      sha256 "6410cb6aaa26235c5da9e69a39810830af6af8cf11d3a99bd8b9f3de4ebd8e2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.25.0/fountain-linux-arm64"
      sha256 "02b2e0dc13db933263c3dee14fed2efeefa3687bd3c06d7fbfbcc6589c4a2736"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.25.0/fountain-linux-amd64"
      sha256 "bdcdb13cc426b32a69b2adb8ea7cb7188eb119d0f771a42cc08b771d3f222d23"
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
