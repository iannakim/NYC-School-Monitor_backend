class SeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :School
  has_one :EllProgram
end
