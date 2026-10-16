class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.23"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.23/managoat-darwin-arm64"
      sha256 "7826d7fbe06ac8825b8c9f3ac77f108b197b006f81efd93e6a70075e9d95352c"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.23/managoat-darwin-amd64"
      sha256 "64d244fe028f0ab65a8eae3494d14375ab6f4535252f74a94c1a0b0c76890d46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.23/managoat-linux-arm64"
      sha256 "53af19523388e8f34913c3adcff7c8393edacfd52f94d9996fb7473169d88b7d"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.23/managoat-linux-amd64"
      sha256 "399bdb035d9c6e94b877d101b2a8f5c4f742c7258c8fcc843eab121276924f7c"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    bin.install "managoat-#{os}-#{arch}" => "managoat"
    bin.install_symlink bin/"managoat" => "fountain"
  end

  test do
    assert_match "managoat", shell_output("#{bin}/managoat --help")
  end
end
