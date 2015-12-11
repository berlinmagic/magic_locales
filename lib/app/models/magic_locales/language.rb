# encoding: utf-8
class MagicLocales::Language < ActiveRecord::Base
  
  # =====> R E W R I T E S <================================================================= #
  MODEL_PARAMS = [ :id, :locale_id, :level, :_destroy ]
  
  # =====> C O N S T A N T S <=============================================================== #
  LEVELS = %w(basic medium advanced excelent) # => and 'native'
  
  # =====> A S S O Z I A T I O N S <========================================================= #
  belongs_to :owner,    polymorphic: true
  belongs_to :locale,   class_name: "Wizard::Locale",   foreign_key: :locale_id
  
  
  # =====> A T T R I B U T E S <============================================================= #
  delegate   :name, :iso_code, to: :locale, allow_nil: true
  
  
  # =====> V A L I D A T I O N <============================================================= #
  validates :locale, presence: true
  
  
  # =====> C A L L B A C K S <=============================================================== #
  # before_validation :clean_up_values
  
  
  # =====> S C O P E S <===================================================================== #
  
  # =====> C L A S S - M E T H O D S <======================================================= #
  
  # =====> I N S T A N C E - M E T H O D S <================================================= #
  
  # =====>  P  R  I  V  A  T  E  !  <======================================================== # # # # # # # #
private
  
  # def clean_up_values
  #   if self.iso_code.present? && self.iso_code_changed?
  #     self.iso_code = if self.iso_code.split("-").count > 1
  #       "#{self.iso_code.split("-")[0].to_s.downcase}-#{self.iso_code.split("-")[1].to_s.upcase}"
  #     else
  #       self.iso_code.to_s.downcase
  #     end
  #   end
  # end
  
end
