class BusinessUser::RegistrationsController < Devise::RegistrationsController
  def edit
    super
  end

  def new
    super
  end

  private

  def account_update_params
    params.require(:business_user).permit(:email, :password, :password_confirmation, :current_password, :city)
  end
end