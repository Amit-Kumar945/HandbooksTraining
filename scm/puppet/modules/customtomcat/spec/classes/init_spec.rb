require 'spec_helper'
describe 'customtomcat' do
  context 'with default values for all parameters' do
    it { should contain_class('customtomcat') }
  end
end
