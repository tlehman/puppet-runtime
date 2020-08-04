platform "ubuntu-16.04-ppc64el" do |plat|
  plat.servicedir "/lib/systemd/system"
  plat.defaultdir "/etc/default"
  plat.servicetype "systemd"
  plat.codename "xenial"

  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat.get_codename}.deb"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper rsync fakeroot binutils-powerpc64le-linux-gnu"
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends "

  packages = [
    "bison",
    "libreadline-dev",
    "openjdk-8-jdk",
    "pkg-config",
    "pl-binutils-ppc64el",
    "pl-cmake",
    "pl-gcc-ppc64el",
    "pl-ruby",
    "systemtap-sdt-dev",
    "xutils-dev",
    "zlib1g-dev"
  ]

  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends #{packages.join(' ')}"

  plat.cross_compiled true
  plat.vmpooler_template "ubuntu-1604-x86_64"
  plat.output_dir File.join("deb", plat.get_codename, "PC1")
end
