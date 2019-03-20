class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_session

	add_flash_types :not_found
end
