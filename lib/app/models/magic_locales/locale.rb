# encoding: utf-8
class MagicLocales::Locale < ActiveRecord::Base
  
  # =====> R E W R I T E S <================================================================= #
  
  # =====> C O N S T A N T S <=============================================================== #
  STATES = %w(inactive active live)
  
  # =====> A S S O Z I A T I O N S <========================================================= #
  
  # =====> A T T R I B U T E S <============================================================= #
  translates :name, fallbacks_for_empty_translations: true
  accepts_nested_attributes_for :translations, reject_if: proc { |attributes| attributes['name'].blank? }
  
  
  # =====> V A L I D A T I O N <============================================================= #
  validates :iso_code, presence: true, length: { in: 2..6 }, format: { with: /\A[a-z]{2}(-[A-Z]{2,3})?\z/ }
  
  
  # =====> C A L L B A C K S <=============================================================== #
  before_validation :clean_up_values
  
  
  # =====> S C O P E S <===================================================================== #
  # default_scope { includes(:translations).with_translations(I18n.available_locales).order( 'locale_state ASC, wizard_locale_translations.name ASC' ) } 
  # default_scope { includes(:translations).with_translations(I18n.locale).order( 'wizard_locale_translations.name ASC' ) } 
  
  
  # =====> C L A S S - M E T H O D S <======================================================= #
  def self.search(search)
    if search
      with_translations.where('name LIKE ?', "%#{search}%")
    else
      with_translations
    end
  end
  
  ## MicroMachine .. (Finite State Machine)
  def do_transition!( transition )
    state.trigger( transition.to_sym )
    self.save
  end

  def state
    @state ||= begin
      fsm = MicroMachine.new(locale_state || "inactive")
      fsm.when(:activate, "inactive" => "active")
      fsm.when(:release, "active" => "live")
      fsm.when(:deactivate, "active" => "inactive", "live" => "inactive")
      fsm.on(:any) { self.locale_state = state.state }
      fsm
    end
  end
  
  
  # =====> I N S T A N C E - M E T H O D S <================================================= #
  def with_translations(*locales)
    locales = translated_locales if locales.empty?
    includes(:translations).with_locales(locales).with_required_attributes
  end
  
  
  # =====>  P  R  I  V  A  T  E  !  <======================================================== # # # # # # # #
private
  
  def clean_up_values
    if self.iso_code.present? && self.iso_code_changed?
      self.iso_code = if self.iso_code.split("-").count > 1
        "#{self.iso_code.split("-")[0].to_s.downcase}-#{self.iso_code.split("-")[1].to_s.upcase}"
      else
        self.iso_code.to_s.downcase
      end
    end
    
  end
  
  
end
