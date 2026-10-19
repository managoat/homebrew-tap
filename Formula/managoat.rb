class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.37.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.37.0/managoat-darwin-arm64"
      sha256 "ef5c908b593a93a1b235b8fedfa059a8133e54cb54e284905142d5631b699f8a"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.37.0/managoat-darwin-amd64"
      sha256 "cbc59b53e6da72cdcdfb528e2543292562e8f656a4931633354b4626f600e9b1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.37.0/managoat-linux-arm64"
      sha256 "e45ade158321e65675880525680e24925455105f71fc30c0cc836aff169b2092"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.37.0/managoat-linux-amd64"
      sha256 "78261fb41d6c875bc26af9d77d3090e4e728cd3db779ea5bed90edb90b79d3ca"
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
