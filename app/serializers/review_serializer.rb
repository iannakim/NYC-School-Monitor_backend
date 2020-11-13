class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user, :content, :created_at, :updated_at
  has_one :user
  has_one :school
end
