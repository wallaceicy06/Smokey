class UserForJackSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name
  # has_many :jacks, embed: :id, include: false
end
