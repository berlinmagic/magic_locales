# encoding: utf-8
class MagicLocales::BaseController < ApplicationController
  
  # => layout proc { |controller| controller.request.xhr? ? false : "application" }
  
  before_action :authenticate_visitor, except: [:change_locale]
  
  
  private

    # overwrite for authentication
    def authenticate_visitor
      true
    end

end
