require 'spec_helper'
describe 'power' do

  context 'with defaults for all parameters' do
    it { should contain_class('power') }
  end
end
