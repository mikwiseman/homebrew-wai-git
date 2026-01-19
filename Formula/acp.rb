class Acp < Formula
  desc "AI-powered git add, commit, and push in one command"
  homepage "https://github.com/mikwiseman/wai-git"
  url "https://github.com/mikwiseman/wai-git/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "ffe1e48aaac6b531f3570dd98f4ab6d92e4eeff6524a263a98e0068513a16d93"
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
