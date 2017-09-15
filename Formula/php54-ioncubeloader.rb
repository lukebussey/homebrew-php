require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php54Ioncubeloader < AbstractPhp54Extension
  init
  desc "Loader for ionCube Secured Files"
  homepage "http://www.ioncube.com/loaders.php"
  url "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_dar_x86-64.tar.gz"
  sha256 "e5683c7340f6f6b98de36d9afdd961aa8d2c7949432868502b84a43959802c0d"
  version "10.0.2"

  bottle do
    cellar :any_skip_relocation
    sha256 "5f739d716d48d4db1db036d056b67f3e19b1af53c5025743581350054f5d9de2" => :sierra
    sha256 "bc8a0c0eb18990a8934320be781ecd698f11df2bb2bb23a3037be72c92112d57" => :el_capitan
    sha256 "dcaeefe22a2d4718c96a808c4e9c30b8527c1de07303d70a0076e66bf93ad0b9" => :yosemite
  end

  def extension_type
    "zend_extension"
  end

  def install
    prefix.install "ioncube_loader_dar_5.4.so" => "ioncubeloader.so"
    write_config_file if build.with? "config-file"
  end

  test do
    shell_output("php -m").include?("ionCube")
  end
end
