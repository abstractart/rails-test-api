# Serializer for Message model
class MessageSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :updated_at, :author_nickname
end
