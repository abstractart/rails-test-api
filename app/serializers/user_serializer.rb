# Serializer for User model
class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :email
end
