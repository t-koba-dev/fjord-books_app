class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash = {})
    hash[:uid] = User.create_unique_string
    super
  end

  protected
  def update_resource(resource, params)
    if params["password"].present? || params["password_confirmation"].present?
      return super
    end
    resource.update_without_password(params.except("current_password"))
  end
end
