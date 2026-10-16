class Managoat < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/managoat"
  version "0.31.7"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.7/managoat-darwin-arm64"
      sha256 "2e4171577f90511278dfe8c8d293df035f991252407d17d101ea13d3ce1430b3"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.7/managoat-darwin-amd64"
      sha256 "7876815ce12bcf210502c2bbf59f56d8a6720a6290a16e2815cb0d4940556f35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/managoat/releases/download/v0.31.7/managoat-linux-arm64"
      sha256 "20709eec7e4e55b5559d38b4d25cd562d1530caea0af0cc66361f192366ae58d"
    end
    on_intel do
      url "https://github.com/managoat/managoat/releases/download/v0.31.7/managoat-linux-amd64"
      sha256 "2e251981108bacf228b50c3cdcd6aa91ad8ad6ebccb8783e8472eb815aba30ec"
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
