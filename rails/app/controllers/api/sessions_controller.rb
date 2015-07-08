class Api::SessionsController < ApplicationController
  def show
    if session[:username]
       render json: {username: session[:username]}, status: :ok
    else
       render json: {}, status: :unauthorized
    end
  end

  def create
    logger.debug "Params #{params}"

    user = validate_ticket

    logger.debug "Got #{user}"

    if user.nil?
      render json: {}, status: :unauthorized
    else
      session[:username] = user
      render json: {username: user}, status: :created
    end
  end

  def destroy
    logger.debug "Invalidating #{session[:username]}"

    session.delete(:username)

    render json: {}, status: :ok
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
