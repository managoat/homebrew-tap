class Fountain < Formula
  desc "CLI for Managoat — HTTP/JSON client, SSE consumer, and secret-store helper"
  homepage "https://github.com/managoat/fountain"
  version "0.26.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.26.0/fountain-darwin-arm64"
      sha256 "57d9650dd7171e709c999ac89c57b40a02367e18c7f93183f14749e3f8330042"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.26.0/fountain-darwin-amd64"
      sha256 "143c556ab92a86164f9650ea0f72ac41d3657ab32480119f7087dc58cbadf276"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/managoat/fountain/releases/download/v0.26.0/fountain-linux-arm64"
      sha256 "78dfb21c6bccdfc5e0407a3c2cc017835e1d2e0109b8e2a0fad71dcd2f4e0fad"
    end
    on_intel do
      url "https://github.com/managoat/fountain/releases/download/v0.26.0/fountain-linux-amd64"
      sha256 "989c76829147e3cc1eb992e0de8729d21958b9cab9f6690df7f9e1b6c5956406"
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
