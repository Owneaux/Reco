class HomeController < ApplicationController

  def welcome

  end

  def sign_process
    business = params[:role_option] == "business"
    login = params[:submit_option] == "login"
    if business
      if login
        redirect_to new_business_user_session_path
      else
        redirect_to new_business_user_registration_path
      end
    else
      if login
        redirect_to new_user_session_path
      else
        redirect_to new_user_registration_path
      end
    end
  end

end