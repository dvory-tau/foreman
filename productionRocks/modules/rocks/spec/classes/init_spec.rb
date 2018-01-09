require 'spec_helper'
describe 'rockspuppet' do

  context 'with defaults for all parameters' do
    it { should contain_class('rockspuppet') }
  end
end
