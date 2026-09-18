class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.20.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.20.1/fountain-darwin-arm64"
      sha256 "3fb005ea09664ef67ff1f10b4ed7578d298b35d85d1990c28cf29cec0a09bb9c"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.20.1/fountain-darwin-amd64"
      sha256 "4598770c3a1af26304185c77ff47b3d99f10bf4a34a011db928bae91bad1b0c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.20.1/fountain-linux-arm64"
      sha256 "4b7982fb8cec667df8968501ec6a66017c7b81d74c105898ceee4b2947e4ee0e"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.20.1/fountain-linux-amd64"
      sha256 "8a1fa1a78d40057356528e7d7fd84461c1436a1bc5c718ad61f4db57aa2c45b9"
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
