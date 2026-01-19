class Acp < Formula
  desc "AI-powered git add, commit, and push in one command"
  homepage "https://github.com/mikwiseman/wai-git"
  url "https://github.com/mikwiseman/wai-git/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "a96f7b0aac86fc865ec7563c1d45d4c5c03b6d79f95fa39ce5fb64d8ab1d554e"
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
