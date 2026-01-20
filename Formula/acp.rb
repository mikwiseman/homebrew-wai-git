class Acp < Formula
  desc "AI-powered git add, commit, and push in one command"
  homepage "https://github.com/mikwiseman/wai-git"
  url "https://github.com/mikwiseman/wai-git/archive/refs/tags/v1.2.4.tar.gz"
  sha256 "da896c9f612fda8e183719d5a6f0069292e9c2ffacc9176cb3f1db10b9a6813b"
  license "MIT"

  depends_on "curl"
  depends_on "git"
  depends_on "jq"

  def install
    bin.install "acp"
  end

  def caveats
    <<~EOS
      To use acp, configure your API key:

        mkdir -p ~/.config/acp
        echo 'ACP_OPENAI_API_KEY=sk-...' >> ~/.config/acp/config

      Or use Ollama (free, local):

        ollama pull qwen2.5-coder:7b
        acp --provider ollama
    EOS
  end

  test do
    assert_match "acp version", shell_output("#{bin}/acp --version")
  end
end
