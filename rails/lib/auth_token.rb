class AuthToken
  def self.encode(payload, exp=60.minutes.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    payload = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
    puts "Successfully decoded #{payload}"
    DecodedAuthToken.new(payload)
  end
end

# We could just return the payload as a hash, but having keys with indifferent access is always nice, plus we get an expired? method that will be useful later
class DecodedAuthToken < HashWithIndifferentAccess
  def expired?
    self[:exp] <= Time.now.to_i
  end
end
