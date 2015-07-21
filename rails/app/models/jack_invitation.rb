class JackInvitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :jack
  validates :user, presence: true
  validates :jack, presence: true, uniqueness: {scope: :user}
end
