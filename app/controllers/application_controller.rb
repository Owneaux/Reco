class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  before_action :init_common_params

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || home_index_path
  end

  private

  def init_common_params
    if current_business.nil?
      @role = "Promoter"
      @header_title = "Promoter"
    else
      @role = "Business"
      @header_title = "Business"
    end
  end
end
