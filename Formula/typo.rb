class Typo < Formula
  desc "AI powered terminal agent"
  homepage "https://github.com/jeremiahrose/typo"
  url "https://github.com/jeremiahrose/typo.git", tag: "0.5.0"
  license "MIT"
  head "https://github.com/jeremiahrose/typo.git", branch: "main"

  depends_on "fd"
  depends_on "fzf"
  depends_on "jq"

  def install
    prefix.install Dir["src/*"]
  end

  def caveats
    <<~EOS
      To use `typo`, you need to source it in your shell profile and configure your OpenAI API key.
      Add the following line to your ~/.zshrc (or ~/.bashrc if using Bash):

        source #{opt_prefix}/typo.sh
        export OPENAI_API_KEY=your_openai_key
        export TYPO_CUSTOM_PROMPTS_DIR=optional_directory_containing_custom_prompts

      After adding this line, restart your terminal or run `source ~/.zshrc` (or `source ~/.bashrc`).
    EOS
  end

  test do
    assert_match "echo hello world", shell_output("source #{prefix}/typo.sh && typo say hello world")
  end
end
