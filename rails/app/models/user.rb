class User < ActiveRecord::Base
  has_many :jack_invitations
  has_many :invited_jacks, through: :jack_invitations, source: :jack
  validates :username, :first_name, :last_name, presence: true
  before_save :infer_email_address

  def generate_auth_token
    payload = { user_id: self.id, username: self.username }
    AuthToken.encode(payload)
  end

  private
    
    def infer_email_address
      self.email = "#{self.username}@rice.edu"
    end
end
