class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :first_name, :last_name
  has_many :invited_jacks, serializer: JackForUserSerializer, include: false, embed: :id
end
