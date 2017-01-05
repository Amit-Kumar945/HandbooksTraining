require 'spec_helper'
describe 'custommysql' do
  context 'with default values for all parameters' do
    it { should contain_class('custommysql') }
  end
end
