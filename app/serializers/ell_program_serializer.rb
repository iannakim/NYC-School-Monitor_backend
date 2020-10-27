class EllProgramSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :ses
end
