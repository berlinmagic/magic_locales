require "action_view/helpers/asset_tag_helper"

# encoding: utf-8
module FlagHelper
  
  def magic_locaoles_admin_template(options = {}, &block)
    options.merge!(:body => capture(&block))
    render(:partial => "magic_locales/admin_template", :locals => options)
  end
  
  def flag( lcl = I18n.locale.to_s )
    # raw( image_tag( "flags/flags_#{lcl}.png", class: "flag" ) )
    locale_flag( lcl, "small" )
  end
  
  def locale_flag( lcl = I18n.locale.to_s, format = "small" )
    format = "medium" unless %w(small medium large).include?(format)
    lcl = "xx" unless %w(en bg cs da de el es fi fr hr hu it nl pl pt ru sv uk).include?( lcl.to_s.downcase )
    raw( image_tag( "flags/locales/#{format}/flag-#{lcl.to_s.downcase}.png", class: "flag" ) )
  end
  
  def country_flag( lcl = I18n.locale.to_s, format = "small" )
    format = "medium" unless %w(small medium large).include?(format)
    lcl = "xx" unless %w(at by be ba bg ca hr cy cz dk fi fr de gr hu ie it lv li lt lu nl no pl pt ro ru rs sk si es se ch ua gb us).include?( lcl.to_s.downcase )
    raw( image_tag( "flags/countries/#{format}/flag-#{lcl.to_s.downcase}.png", class: "flag" ) )
  end
  
  
end