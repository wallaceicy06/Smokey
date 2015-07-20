class JackSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :invited_users, serializer: UserForJackSerializer, include: false, embed: :id
end
