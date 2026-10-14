class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.23.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.23.0/fountain-darwin-arm64"
      sha256 "9534d0a0959eec70028f2bed8aa4197eb63954791bc9398c53b3621c9c76dc70"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.23.0/fountain-darwin-amd64"
      sha256 "847b8f737561ca5ca0d63721604870391c0eaf956196719db7930c7ffedb34a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.23.0/fountain-linux-arm64"
      sha256 "0e5d58eee16bc68baf880960de0a8099f2a74d899a4f39fb79d0091b239f96a5"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.23.0/fountain-linux-amd64"
      sha256 "a892e586d70a0ae7adcd4e08c638e167470114d2201e7fea7e35b357e42d31fe"
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
