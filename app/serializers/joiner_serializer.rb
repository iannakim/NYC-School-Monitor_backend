class JoinerSerializer < ActiveModel::Serializer
  attributes :id, :school_id, :option_id
  has_one :school
  has_one :option
end
