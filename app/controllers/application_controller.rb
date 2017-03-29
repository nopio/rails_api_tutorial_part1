class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

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

  def current_admin
    @admin
  end

  private

  def authenticate_admin_request
    authenticate_admin_with_token || render_unauthorized_request
  end

  def authenticate_user_request
    authenticate_user_with_token || render_unauthorized_request
  end

  def authenticate_admin_with_token
    authenticate_with_http_token do |token, options|
      @admin = User.find_by(api_key: token, admin: true)
    end
  end

  def authenticate_user_with_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized_request
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: { error: 'Bad credentials' }, status: 401
  end
end
