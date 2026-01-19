class Acp < Formula
  desc "AI-powered git add, commit, and push in one command"
  homepage "https://github.com/mikwiseman/wai-git"
  url "https://github.com/mikwiseman/wai-git/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "9548af412a68e7b40b5d0c4a18572b90ff5e6b8cacf2ca5f6f8fe5ea2b74a08f"
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
