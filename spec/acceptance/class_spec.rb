require 'spec_helper_acceptance'

describe 'cmake class:' do
  context 'default parameters' do
    it 'should run successfully' do
      pp = "class { 'cmake': }"

      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
    end

    if fact('osfamily') =~ /RedHat/
      [
        'cmake',
        'cmake28',
      ].each do |p|
        describe package(p) do
          it { should be_installed }
        end
      end
    end
  end
end
