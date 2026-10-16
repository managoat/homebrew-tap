class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.10"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.10/managoat-darwin-arm64"
      sha256 "5d1cccdfa10d3521a677ef4df0e09d66f8ff494ef6b27d994462ad6cedd7d9ba"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.10/managoat-darwin-amd64"
      sha256 "a167ea44c858f1a18cfc38ab513ab6a6d8432a25bf68a692d5c270dff7446feb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.10/managoat-linux-arm64"
      sha256 "7eff2e02785cb099b51f2749b4d79d4d7331a02d2ca85a31f2922542e60565e7"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.10/managoat-linux-amd64"
      sha256 "590d4edde06e5fc331c08a22124964d3e7fee6c5add14e51d4302410ba1eaeb3"
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
