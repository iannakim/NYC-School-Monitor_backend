class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_one :User
  has_one :School
end
