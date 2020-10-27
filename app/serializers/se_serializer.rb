class SeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :school
  has_one :ell_program
end
