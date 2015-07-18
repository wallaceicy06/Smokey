class ApplicationController < ActionController::Base    
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :authenticate_request

  class NotAuthenticatedError < StandardError
  end

  class AuthenticationTimeoutError < StandardError
  end

  rescue_from NotAuthenticatedError do
    render json: { error: 'Not authorized' }, status: :unauthorized
  end

  rescue_from AuthenticationTimeoutError do
    render json: { error: 'Authentication token is expired' }, status: 419
  end

  private

    def authenticate_request
      if decoded_auth_token
        @current_user ||= User.find_by id: decoded_auth_token[:user_id]
      end
    rescue JWT::ExpiredSignature
      fail AuthenticationTimeoutError
    rescue
      fail NotAuthenticatedError
    end

    def decoded_auth_token
      @decoded_auth_token ||= AuthToken.decode(http_auth_header_content)
    end

    def http_auth_header_content
      return @http_auth_header_content if defined? @http_auth_header_content
      
      @http_auth_header_content = begin
        if request.headers['Authorization'].present?
          request.headers['Authorization'].split(' ').last
        else
          nil
        end
      end

    end
end


