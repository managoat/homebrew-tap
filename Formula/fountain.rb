class Fountain < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.26.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.26.1/fountain-darwin-arm64"
      sha256 "052e06e041caf5f536783b7af6c01a3a898edcdf86e34516f581d77139c37d16"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.26.1/fountain-darwin-amd64"
      sha256 "f913fe9877c700eacd830843e0726c6753d62831e89119758640952fde8a2ccb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.26.1/fountain-linux-arm64"
      sha256 "9b6fa9d2c0dd6d8be7b700b62045ae1d388f464806abf914953fd2594edd1957"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.26.1/fountain-linux-amd64"
      sha256 "6920d360d0ae8353931e0a932f04b584fa0109b8f7d0912723a6b3283d1ebfb2"
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
