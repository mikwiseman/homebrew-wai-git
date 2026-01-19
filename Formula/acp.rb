class Acp < Formula
  desc "AI-powered git add, commit, and push in one command"
  homepage "https://github.com/mikwiseman/wai-git"
  url "https://github.com/mikwiseman/wai-git/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "4050f3d1c7d3f9da3c312460569e8d61e4426ef073e3b441062c94cc95d8d155"
  license "MIT"

  depends_on "curl"
  depends_on "git"
  depends_on "jq"

  def install
    bin.install "acp"
  end

  def caveats
    <<~EOS
      Run 'acp' in any git repository — setup wizard will guide you on first run.
    EOS
  end

  test do
    assert_match "acp version", shell_output("#{bin}/acp --version")
  end
end
