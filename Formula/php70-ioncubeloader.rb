require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Ioncubeloader < AbstractPhp70Extension
  init
  desc "Loader for ionCube Secured Files"
  homepage "http://www.ioncube.com/loaders.php"
  url "http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_dar_x86-64.tar.gz"
  sha256 "e5683c7340f6f6b98de36d9afdd961aa8d2c7949432868502b84a43959802c0d"
  version "10.0.2"

  bottle do
    cellar :any_skip_relocation
    sha256 "4b1888566a7807df495bf6367c4cf66653cd4d783ab7fe819b829b8794437932" => :sierra
    sha256 "eb37d7b5d4c33c560b1800e330318644859e4a75e21107d57e8262d32677cf51" => :el_capitan
    sha256 "0f5c1002b123e509625da4b96db17059a3788d71401efff4aae84bc26dfe5ed3" => :yosemite
  end

  def extension_type
    "zend_extension"
  end

  def install
    prefix.install "ioncube_loader_dar_7.0.so" => "ioncubeloader.so"
    write_config_file if build.with? "config-file"
  end

  test do
    shell_output("php -m").include?("ionCube")
  end
end
