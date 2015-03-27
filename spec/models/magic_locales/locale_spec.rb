require 'spec_helper'

RSpec.describe MagicLocales::Locale, type: :model do
  
  describe 'should have usual attributes' do
    
    it { should respond_to :iso_code }
    it { should respond_to :name }
    
    it { should respond_to :translations }
    
    it { should respond_to :locale_state }
    
    it { should respond_to :translations }
    # it { should respond_to :translations_attributes }
    
  end
  
  describe 'validations' do 
    it { should validate_presence_of :iso_code }
    it { should validate_length_of(:iso_code).is_at_least(2) }
    it { should validate_length_of(:iso_code).is_at_most(6) }
    
    it { should_not allow_value('fiz').for(:iso_code) }
    it { should_not allow_value('Foo').for(:iso_code) }
    it { should_not allow_value('english').for(:iso_code) }
    it { should allow_value('en').for(:iso_code) }
    it { should allow_value('de').for(:iso_code) }
    it { should allow_value('de-DE').for(:iso_code) }
    it { should allow_value('dE-dE').for(:iso_code) }
  end
  
end
