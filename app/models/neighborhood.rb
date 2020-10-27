class Neighborhood < ApplicationRecord
  has_many :schools
  belongs_to :borough
end
