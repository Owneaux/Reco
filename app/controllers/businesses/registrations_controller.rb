class Businesses::RegistrationsController < Devise::RegistrationsController
  def edit
    super
  end

  def new
    super
  end

  private

  def account_update_params
    params.require(:business).permit(:email, :password, :password_confirmation, :current_password, :city)
  end
end