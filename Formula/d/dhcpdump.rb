class Dhcpdump < Formula
  desc "Monitor DHCP traffic for debugging purposes"
  homepage "https://github.com/bbonev/dhcpdump"
  url "https://github.com/bbonev/dhcpdump/releases/download/v1.9/dhcpdump-1.9.tar.xz"
  sha256 "3658ac21cc33e79e72bed070454e49c543017991cb6c37f4253c85e9176869d1"
  license "BSD-2-Clause"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "62635186a885739e158d1dee56b62dfce2f5d304a31c25cd4a249d594f86aeb7"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "00e07738f28c1a7171439c05e7bbbe082a58db87bb52b7227920c5f6b1fb17d9"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "1a948ff9d54f73ace571fef91ff0ea06c09216ecac07e4665526ad4caeb680de"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "ea331a3bb132f7f9fbc334e85fd7d7cfc6cf7314df93bf123c5e042febbe1951"
    sha256 cellar: :any_skip_relocation, sonoma:         "9b0073f08bd03f60e45293f99f3870653fdf8249caeebe73d782d29bd06ea1f1"
    sha256 cellar: :any_skip_relocation, ventura:        "51665ae0067f51c4ce8afa58c84ce5dd507834610a8bc03a7c212bd7026f4a09"
    sha256 cellar: :any_skip_relocation, monterey:       "305c41098112a0cd36fcbf838f9a9d575ae2764ffa7db65fa2f53874639b4cfa"
    sha256 cellar: :any_skip_relocation, big_sur:        "c6661ad77e8aa1a0355ca8c93454e9a5cba9936790b2fdbf97ada7c7e094af1a"
    sha256 cellar: :any_skip_relocation, catalina:       "508365f542d3fc6574525a2b2ccacc4467b40fd53b9885e8c4e91e9e2b172f21"
    sha256 cellar: :any_skip_relocation, mojave:         "5c0e4a3120148871209e5943dd42c5fc81ad6b8d0e78e0964d2dc46829ac5030"
    sha256 cellar: :any_skip_relocation, high_sierra:    "d49aaa82bf92fd7adeb0edb91812d4c48aa20fb0af2f30f9b4238d032dbb99ce"
    sha256 cellar: :any_skip_relocation, sierra:         "10e6565cdd5717666822ce9a0f77747d44969b5cbc7c3ccf1505aaa6ba95af85"
    sha256 cellar: :any_skip_relocation, el_capitan:     "1f30cb4146a741b3523d674336854c665546e939af04f619e38623d9298cd4ef"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "f1fe4468b6228999e79e24c13f4b4e65b32d8124f1928f08960b2b144ed63077"
  end

  uses_from_macos "libpcap"

  def install
    inreplace "Makefile", "-Wl,-z,relro -Wl,-z,now", "" if OS.mac?
    system "make", "CFLAGS=-DHAVE_STRSEP"
    bin.install "dhcpdump"
    man8.install "dhcpdump.8"
  end

  test do
    system "#{bin}/dhcpdump", "-h"
  end
end
