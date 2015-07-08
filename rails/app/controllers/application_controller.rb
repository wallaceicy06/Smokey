class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.

    # after_filter :cors_set_access_control_headers

    # def cors_set_access_control_headers
        # headers['Access-Control-Allow-Origin']      = 'http://localhost:4200'
        # headers['Access-Control-Allow-Methods']     = 'GET, POST, OPTIONS'
        # headers['Access-Control-Max-Age']           = '1728000'
        # headers['Access-Control-Allow-Credentials'] = 'true'
    # end
    
    protected
      
      def logged_in
        if session[:username] == nil
          render json: {}, status: :unauthorized
        end
      end
end
