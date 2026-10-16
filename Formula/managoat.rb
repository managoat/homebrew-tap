class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.11"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.11/managoat-darwin-arm64"
      sha256 "ae969dc7549658ba032a7c17883fc4d60a175126ea4f6352732fc5bdfb94fac1"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.11/managoat-darwin-amd64"
      sha256 "3b77f19c43aad22b663e01f32696fa8bd222cd50d6de8958ec2e3b579b1e9f98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.11/managoat-linux-arm64"
      sha256 "41a93293465600ffdf191b85f3da2709f934af58c58b82aea0cf1f3fa669f048"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.11/managoat-linux-amd64"
      sha256 "585887af68f3ca786d4fe229c9e84fbf5cb899ad968006990c4ff27ae58372f6"
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
