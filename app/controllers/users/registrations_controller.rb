module Users
  class RegistrationsController < Devise::RegistrationsController
    protected

    def update_resource(resource, params)
      if current_user.provider == 'google_oauth2'
        resource.update_without_password(params.except('current_password'))
      else
        resource.update_with_password(params)
      end
    end
  end
end
