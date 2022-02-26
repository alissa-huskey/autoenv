class AutoenvRevert < Formula
  desc "Per-project, per-directory shell environments with cache & revert."
  homepage "https://github.com/alissa-huskey/autoenv"
  url "https://github.com/alissa-huskey/autoenv/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "d2a309caef6b3ba7050fa8c42287ea2956237c1f3762a350c1fe41c389612f4f"
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
