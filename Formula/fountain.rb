class Fountain < Formula
  desc "CLI for Fountain — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.24.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.24.0/fountain-darwin-arm64"
      sha256 "79325a06f1b609b3233ecf9b7de033a7118e500dfdcffca66e79f6fea3393e76"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.24.0/fountain-darwin-amd64"
      sha256 "c0d90ac093757bbfe7348faf5039a45465e3c8a320aca18332914e2144f8469a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.24.0/fountain-linux-arm64"
      sha256 "bb6682d4708b9258f6a38fe75f4c0649d42bbe4a6c569a203b79adaaa8d2c084"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.24.0/fountain-linux-amd64"
      sha256 "934b8308ec460b60ce534271b0cfd0107f72033bf1cced9eda0b965972a5bd3d"
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
