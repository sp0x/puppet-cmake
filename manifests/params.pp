# == Class: cmake::params
#
class cmake::params {
  case $::osfamily {
    'RedHat': {
      include epel

      $packages         = [ 'cmake', 'cmake28' ]
      $package_require  = Yumrepo['epel']
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }
}
