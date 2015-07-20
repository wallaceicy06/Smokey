class AuthController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    username = validate_ticket 

    user = User.where({ username: username }).first

    if user.nil?
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    else
      render json: { user_id: user.id, username: username, token: user.generate_auth_token }
    end
  end

  private

    def validate_ticket
      uri = URI("https://netid.rice.edu/cas/serviceValidate")
      args = {ticket: params[:ticket], service: "http://localhost:4200/session/validate"}
      uri.query = URI.encode_www_form(args)

      res = Net::HTTP.get_response(uri)

      cas_data = Hash.from_xml(res.body.gsub("\n", ""))["serviceResponse"]

      logger.debug "CAS data: #{cas_data}"
       
      if cas_data["authenticationSuccess"]
          return cas_data["authenticationSuccess"]["user"]
      else
          return nil
      end
    end
end
