# encoding: utf-8
class MagicLocales::LocalesController < MagicLocales::BaseController
  
  # => layout proc { |controller| controller.request.xhr? ? 'xhr' : get_layout }
  layout proc { |controller| controller.request.xhr? ? false : "application" }
  
  def index
    # => @locales = ::MagicLocales::Locale.includes(:translations).with_translations(I18n.locale).order( 'mgclang_locale_translations.name ASC' )
    @locales = MagicLocales::Locale.where(locale_state: "live").includes(:translations).with_translations(I18n.locale).order( 'mgclang_locale_translations.name ASC' )
    @locales += MagicLocales::Locale.where(locale_state: "active").includes(:translations).with_translations(I18n.locale).order( 'mgclang_locale_translations.name ASC' )
    @locales += MagicLocales::Locale.where(locale_state: "inactive").includes(:translations).with_translations(I18n.locale).order( 'mgclang_locale_translations.name ASC' )
  end
  
  def new
    @locale = MagicLocales::Locale.new()
    render :form
  end
  
  def create
    @locale = MagicLocales::Locale.new(locale_params)
    if @locale.save
      redirect_to action: :index, notice: "Saved locale"
    else
      redirect_to action: :index, alert: "Error! #{@locale.errors.full_messages.join(" ")}"
    end
  end
  
  def edit
    @locale = MagicLocales::Locale.find(params[:id])
    render :form
  end
  
  def update
    @locale = MagicLocales::Locale.find(params[:id])
    if @locale.update(locale_params)
      redirect_to action: :index, notice: "Saved locale"
    else
      redirect_to action: :index, alert: "Error! #{@locale.errors.full_messages.join(" ")}"
    end
  end
  
  def trigger
    @locale = MagicLocales::Locale.find( params[:id] )
    @locale.do_transition!( params[:state].to_sym )
    redirect_to action: :index
  end
  
  def change_locale
    if I18n.available_locales.include?( params[:locale].to_sym )
      session[:user_locale] = params[:locale]
      session[:locale] = params[:locale]
      I18n.locale = params[:locale]
    end
    redirect_to url_for( Rails.application.routes.recognize_path( params[:back] ).merge({locale: params[:locale]}) ), notice: I18n.t("messages.locale_changed", locale: params[:locale])
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def locale_params
      params.require(:magic_locales_locale).permit(:name, :natural_name, :iso_code, :translations_attributes => [:id, :name, :locale])
    end
end

