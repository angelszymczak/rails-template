# frozen_string_literal: true

module AuthenticateRequest
  # @headers: { 'Authorization': 'Bearer AUTH_TOKEN' }
  def self.call(auth_token)
    unless (token = auth_token&.split(' ')&.[](1))
      raise I18n.t('errors.authenticate_request.missing_token')
    end

    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')
    return unless (user_id = decoded_token[0]['user_id'])

    User.find(user_id)
  rescue JWT::DecodeError
    raise I18n.t('errors.authenticate_request.invalid_token')
  rescue ActiveRecord::RecordNotFound
    raise I18n.t('errors.authenticate_request.user_not_found')
  end
end
