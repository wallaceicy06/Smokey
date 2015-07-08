class Api::SessionsController < ApplicationController
  def index
    render json: {'hello': 'world'}, status: :ok
  end

  def create
    user = validate_ticket

    logger.debug "Got #{user}"

    unless user.nil?
      session[:username] = user
    end

    redirect_to "http://localhost:4200/"
  end

  private

    def validate_ticket
      uri = URI("https://netid.rice.edu/cas/serviceValidate")
      args = {ticket: params[:ticket], service: url_for(params.except(:ticket))}
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
