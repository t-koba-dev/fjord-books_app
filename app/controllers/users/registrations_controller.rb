class Users::RegistrationsController < Devise::RegistrationsController

  protected
  def update_resource(resource, params)
    if params["password"].present? || params["password_confirmation"].present?
      return super
    end
    resource.update_without_password(params.except("current_password"))
  end
end
