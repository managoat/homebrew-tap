class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.37.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.37.2/managoat-darwin-arm64"
      sha256 "1f43c3dddc171e515d3d69d111558e9bc0648b161dfb635741fc52cce94f61c5"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.37.2/managoat-darwin-amd64"
      sha256 "46fe2109e4f418fa739c2fc46c51727374a82fa8e99734da86ed8031a78def60"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.37.2/managoat-linux-arm64"
      sha256 "dc1980ec1c1ba4eac4aa55d2b209ddcd595ad973e7323a143521ad5cc7163bf2"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.37.2/managoat-linux-amd64"
      sha256 "165ed5dca9a8fedc40d98b4ada6905218e2474db8ac94c4fbd24db485e3c1b72"
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
