# typed: false
# frozen_string_literal: true

class GitLfsTransfer < Formula
  desc "Server-side implementation of the Git LFS pure-SSH protocol"
  homepage "https://github.com/charmbracelet/git-lfs-transfer"
  license "MIT"
  head "https://github.com/charmbracelet/git-lfs-transfer.git", branch: "master"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "."
  end

  test do
    assert_match "git-lfs-transfer", shell_output("#{bin}/git-lfs-transfer 2>&1", 1)
  end
end
