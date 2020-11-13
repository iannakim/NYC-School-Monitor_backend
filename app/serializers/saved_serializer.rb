class SavedSerializer < ActiveModel::Serializer
  attributes :id, :school, :user
  has_one :user
  has_one :school
end
