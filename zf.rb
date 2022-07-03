class Zf < Formula
  desc "a commandline fuzzy finder that prioritizes matches on filenames"
  homepage "https://github.com/natecraddock/zf"
  url "https://github.com/natecraddock/zf/archive/refs/tags/0.5.tar.gz"
  sha256 "3b5ff72571867f22d51dd1e349c86bf4b00b90604ff3f26de1b95bf752523e8e"
  license "MIT"
  head "https://github.com/natecraddock/zf.git", branch: "master"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Drelease-fast=true"

    bin.install "zig-out/bin/zf"
    man1.install "doc/zf.1"
    bash_completion.install "complete/zf"
    fish_completion.install "complete/zf.fish"
    zsh_completion.install "complete/_zf"
  end

  test do
    assert_equal "zig", pipe_output("#{bin}/zf -f zg", "take\off\every\nzig").chomp
  end
end
