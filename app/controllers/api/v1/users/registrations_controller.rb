module Api::V1::Users
  class RegistrationsController < ApiController
    skip_before_action :doorkeeper_authorize!, only: %i[create]

    include DoorkeeperRegisterable

    def create
      client_app =  Doorkeeper::Application.find_by(uid: params[:client_id])
      unless client_app
        return render json: {error: I18n.t('doorkeeper.errors.messages.invalid_client')}
      end

      allowed_params = user_params.except(:client_id)
      user = User.new(allowed_params)

      if user.save
        render json: render_user(user,client_app), status: :ok
      else
        render json: {errors: user.errors}, status: :unprocessable_entity
      end

    end

    def user_params
      params.permit(:email, :password, :client_id)
    end

  end
end