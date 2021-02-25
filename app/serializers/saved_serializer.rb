class SavedSerializer < ActiveModel::Serializer
  attributes :id, :school
  has_one :school
end
