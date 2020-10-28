class JoinerSerializer < ActiveModel::Serializer
  attributes :id
  has_one :school
  has_one :option
end
