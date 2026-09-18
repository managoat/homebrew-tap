class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.21.0/fountain-darwin-arm64"
      sha256 "44d9b6b4969feeb88b0d3cee278c00c0e78f7fe0263401ba48379ec270a75a2f"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.21.0/fountain-darwin-amd64"
      sha256 "dd83cfdf38fe56bb77d08709a257c1e1a8c1dbb70c763fa8e61ad4dc1ae7e683"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.21.0/fountain-linux-arm64"
      sha256 "f1e696573f40336d52ba12a6f247811cc28959ae62ce5962ebabc8a51f78e927"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.21.0/fountain-linux-amd64"
      sha256 "a226d651818850bd6bf6a4ae7f662e472debd219a6352aa76d23f798572664d2"
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
