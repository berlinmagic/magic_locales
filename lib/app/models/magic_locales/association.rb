# encoding: utf-8
module MagicLocales
  module Association
  
    def self.included(base)
      base.send :extend, ClassMethods
    end
  
    ##   C L A S S - M E T H O D S   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
    module ClassMethods
      
      def has_one_language
        # send :include, InstanceMethods
        
        has_one   :language, 
                      -> { where(level: 'native', default: true) }, 
                      as:         :owner, 
                      class_name: "MagicLocales::Language", 
                      dependent:  :destroy
        
        accepts_nested_attributes_for :language,          allow_destroy: true,    reject_if: :all_blank
      end
      
      
      def has_languages
        # send :include, InstanceMethods
        
        has_many  :spoken_languages, 
                      as:         :owner, 
                      class_name: "MagicLocales::Language", 
                      dependent: :destroy
        
        has_many  :foreign_languages, 
                      -> { where.not(level: 'native') }, 
                      as:         :owner, 
                      class_name: "MagicLocales::Language", 
                      dependent:  :destroy
        
        has_many  :native_languages, 
                      -> { where(level: 'native') }, 
                      as:         :owner, 
                      class_name: "MagicLocales::Language", 
                      dependent:  :destroy
        
        accepts_nested_attributes_for :spoken_languages,  allow_destroy: true,    reject_if: :all_blank
      end
      
      
    end #> ClassMethods
  
    ##   I N S T A N C E - M E T H O D S   # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
    module InstanceMethods
      
      # ...
      
    end #> InstanceMethods
  
  end
end
