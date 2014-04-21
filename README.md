# puppet-cmake

[![Build Status](https://travis-ci.org/treydock/puppet-cmake.png)](https://travis-ci.org/treydock/puppet-cmake)

Installs cmake.

## Support

* CentOS 6 x86_64

## Usage

### Class: `cmake`

Standard usage to install the cmake packages:

    class { 'cmake': }

On RedHat based systems, this installs cmake and cmake28.

#### Parameters for `cmake` class

#####`ensure`

The resource ensure parameter, defaults to 'present'.

#####`packages`

The packges to install for cmake.  Default is OS dependent.

* RedHat - ['cmake', 'cmake28']

#####`package_require`

Sets the `require` parameter for the package resources.  A value of `'UNSET'` can be used to undefine the `require` parameter for the package resources. Default is OS dependent.

* RedHat - `Yumrepo[epel]`

## Development

### Testing

Testing requires the following dependencies:

* rake
* bundler

Install gem dependencies

        bundle install

Run unit tests

        bundle exec rake test

If you have Vagrant >= 1.2.0 installed you can run system tests

    bundle exec rake acceptance
