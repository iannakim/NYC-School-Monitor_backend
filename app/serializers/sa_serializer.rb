class SaSerializer < ActiveModel::Serializer
  attributes :id
  has_one :School
  has_one :ApCourse
end
