class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.22.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.22.0/fountain-darwin-arm64"
      sha256 "04ed82d683bd520c85aed760d5f901b6500dc43963428da8b69f51ac9dcf18d6"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.22.0/fountain-darwin-amd64"
      sha256 "5e9b1fcd8f1a25271e4886e06f9941ac1eb9520c6e51421ecb85a99f6de2f173"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.22.0/fountain-linux-arm64"
      sha256 "ca18f93b2f00eb04a17fc32f6d077eb14daf27d9bac3e4989de08b4c347fa729"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.22.0/fountain-linux-amd64"
      sha256 "59c412f87a6d671782e0a97cda68604c7819541cea33ff489d5c06ddb3c580ce"
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
