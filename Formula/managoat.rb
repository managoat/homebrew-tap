class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.39.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.39.0/managoat-darwin-arm64"
      sha256 "1fc7e30a2e5b8cb0b1126d613e1b9d806f7a861460ad84793949fd0dab0034ca"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.39.0/managoat-darwin-amd64"
      sha256 "d1d32796f27f5dc9a64484a3c171cf52a4c3d873d1c131816cdab987ec1df4f3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.39.0/managoat-linux-arm64"
      sha256 "378ff7334c88884c40e1227250200a1845832217c1b8cb333e240657103cc1bd"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.39.0/managoat-linux-amd64"
      sha256 "6a0a1544d066aefe2d49a99e22b1dfdfd0eb7043482dcb8f1a80fdafe7f75179"
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
