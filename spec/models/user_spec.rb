require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'should have usual attributes' do
    it { should respond_to :name }
    
    it { should_not respond_to :language }
    it { should_not respond_to :spoken_languages }
    it { should_not respond_to :foreign_languages }
    it { should_not respond_to :native_languages }
  end
  
end
