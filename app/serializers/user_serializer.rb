class UserSerializer < ActiveModel::Serializer
  # when requesting user data, we'll get only
  attributes :id, :full_name, :description, :created_at
end
