require 'spec_helper'

describe 'cmake' do
  let :facts do
    {
      :osfamily => 'RedHat',
    }
  end

  it { should create_class('cmake') }
  it { should contain_class('cmake::params') }
  it { should contain_class('epel') }

  it { should have_package_resource_count(2) }

  [
    'cmake',
    'cmake28',
  ].each do |p|
    it do
      should contain_package(p).with({
        :ensure   => 'present',
        :require  => 'Yumrepo[epel]',
      })
    end
  end

  context 'ensure => absent' do
    let(:params) {{ :ensure => 'absent' }}

    [
      'cmake',
      'cmake28',
    ].each do |p|
      it { should contain_package(p).with_ensure('absent') }
    end
  end

  context "packages => 'cmake'" do
    let(:params) {{ :packages => 'cmake' }}

    it { should have_package_resource_count(1) }
    it do
      should contain_package('cmake').with({
        :ensure   => 'present',
        :require  => 'Yumrepo[epel]',
      })
    end
  end

  context "package_require => 'UNSET'" do
    let(:params) {{ :package_require => 'UNSET' }}

    [
      'cmake',
      'cmake28',
    ].each do |p|
      it { should contain_package(p).with_ensure('present') }
      it { should contain_package(p).without_require }
    end
  end
end
