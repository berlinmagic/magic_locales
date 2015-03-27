require 'rails_helper'

describe MagicLocales::Association do
  
  
  class TestPerson < ActiveRecord::Base
    self.table_name = "users"
  end

  class TestUser < ActiveRecord::Base
    self.table_name = "users"
    has_one_language
  end
  
  class TestDude < ActiveRecord::Base
    self.table_name = "users"
    has_languages
  end

  describe "has some kind of address => inherit methods" do

    let(:person){ TestPerson.create!( name: "Bud Spencer"   ) }
    let(:user){   TestUser.create!(   name: "Terence Hill"  ) }
    let(:dude){   TestDude.create!(   name: "The Dude"      ) }


    it "add address attributes only if asked for" do
      expect( person.respond_to?(:language) ).to be false
      expect( user.respond_to?(:language) ).to be true
      expect( dude.respond_to?(:language) ).to be false
      
      expect( person.respond_to?(:spoken_languages) ).to be false
      expect( user.respond_to?(:spoken_languages) ).to be false
      expect( dude.respond_to?(:spoken_languages) ).to be true
      
      expect( person.respond_to?(:foreign_languages) ).to be false
      expect( user.respond_to?(:foreign_languages) ).to be false
      expect( dude.respond_to?(:foreign_languages) ).to be true
      
      expect( person.respond_to?(:native_languages) ).to be false
      expect( user.respond_to?(:native_languages) ).to be false
      expect( dude.respond_to?(:native_languages) ).to be true
    end

  end
  
  describe "has_one_address => inherit methods" do

    let(:micha){ TestPerson.create!(name: "Micha Schmidt") }

    let(:ingo){ TestUser.create!(name: "Ingo Mueller") }

    it "add address attributes only if asked for" do
      expect( ingo.respond_to?(:language) ).to be true
      expect( micha.respond_to?(:language) ).to be false
    end

  end

end
