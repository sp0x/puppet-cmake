# == Class: cmake
#
class cmake (
  $ensure = 'present',
  $packages = $cmake::params::packages,
  $package_require = $cmake::params::package_require
) inherits cmake::params {

  $_package_require = $package_require ? {
    'UNSET' => undef,
    default => $package_require
  }

  package { $packages:
    ensure  => $ensure,
    require => $_package_require,
  }

}
