class Businesses::RegistrationsController < Devise::RegistrationsController
  def edit
    @back_path =  business_show_path
    super
  end

  def new
    super
  end

  private

  def account_update_params
    params.require(:business).permit(:email, :password, :password_confirmation, :current_password, :name, :description, :address, :phone)
  end
end