class RegistrationsController < Devise::RegistrationsController
  def edit
    super
    p "asdadadasdadasdadasd"
  end

  def new
    super
    p "asdadadasdadasdadasd"
  end
end