class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate_request

  protected

  def pagination(records)
    {
      pagination: {
        per_page: records.per_page,
        total_pages: records.total_pages,
        total_objects: records.total_entries
      }
    }
  end

  def current_user
    @user
  end

  private

  def authenticate_request
    authenticate_with_token || render_unauthorized_request
  end

  def authenticate_with_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized_request
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: { error: 'Bad credentials' }, status: 401
  end
end
