require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php55Ioncubeloader < AbstractPhp55Extension
  init
  desc "Loader for ionCube Secured Files"
  homepage "http://www.ioncube.com/loaders.php"
  url "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_dar_x86-64.tar.gz"
  sha256 "e5683c7340f6f6b98de36d9afdd961aa8d2c7949432868502b84a43959802c0d"
  version "10.0.2"

  bottle do
    cellar :any_skip_relocation
    sha256 "dbe57e3b95d21f3a6ba1aef4110a7ba09f3ef9dfa6b3e8b000f023dec694659e" => :sierra
    sha256 "06595e8995a94b56c965dbd93d90b1f5d218e511a957ad1b045341e3f785747c" => :el_capitan
    sha256 "a48aad687f50b131efd230c6f8a3162e42b610c91e20bffb6d7b02edad415b91" => :yosemite
  end

  def extension_type
    "zend_extension"
  end

  def install
    prefix.install "ioncube_loader_dar_5.5.so" => "ioncubeloader.so"
    write_config_file if build.with? "config-file"
  end

  test do
    shell_output("php -m").include?("ionCube")
  end
end
