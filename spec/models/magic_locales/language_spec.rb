require 'spec_helper'

RSpec.describe MagicLocales::Language, type: :model do
  
  describe 'should have usual attributes' do
    it { should respond_to :name }
    it { should respond_to :iso_code }
    
    it { should respond_to :level }
    
    it { should respond_to :user }
    it { should respond_to :locale }
  end
  
end
