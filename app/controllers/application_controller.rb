class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :set_i18n_locale_from_params

  add_flash_types :not_found

  protected

  def set_i18n_locale_from_params
    if params[:locale]
       if I18n.available_locales.map(&:to_s).include?(params[:locale])
         I18n.locale = params[:locale]
       else
          flash.now[:notice] = 
          "#{params[:locale]}" + t('.locale_not_available')
          logger.error flash.now[:notice]
       end			
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
