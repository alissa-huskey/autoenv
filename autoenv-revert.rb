class AutoenvRevert < Formula
  desc "Per-project, per-directory shell environments with cache & revert."
  homepage "https://github.com/alissa-huskey/autoenv"
  url "https://github.com/alissa-huskey/autoenv/archive/refs/tags/v0.3.1.zip"
  sha256 "4935d302b73576c3f43cee0021f582cb294557d52559d7827e2373cce3c6a504"
  license "MIT"
  head "https://github.com/alissa-huskey/autoenv.git", branch: "master"

  def install
    prefix.install "activate.sh"
  end

  def caveats
    <<~EOS
      To finish the installation, source activate.sh in your shell:
        source #{opt_prefix}/activate.sh
    EOS
  end

  test do
    (testpath/"test/.env").write "echo it works\n"
    testcmd = "yes | bash -c '. #{prefix}/activate.sh; autoenv_cd test'"
    assert_match "it works", shell_output(testcmd)
  end
end
