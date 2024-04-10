class Seclists < Formula
  desc "Collection of multiple types of lists used during security assessments"
  homepage "https://github.com/danielmiessler/SecLists"
  url "https://github.com/danielmiessler/SecLists/archive/refs/tags/2024.1.tar.gz"
  sha256 "bc804ddebd1e8ccc6fde885406e2614c9c1ebe052052ae79bcd9f62f96ddad9f"
  license "MIT"

  def install
    cp_r buildpath, prefix/"seclists"
    share.install_symlink "#{prefix}/seclists"
  end

  test do
    assert_predicate prefix/"seclists", :exist?
    json_response = `curl -s "https://api.github.com/repos/danielmiessler/SecLists/git/trees/2024.1"`
    files = JSON.parse(json_response)["tree"].map { |file| file["path"] }
    files.each do |file|
      assert_predicate prefix/"seclists/#{file}", :exist?
    end
  end
end
