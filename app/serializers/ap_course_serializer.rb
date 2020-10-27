class ApCourseSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :sas
end
