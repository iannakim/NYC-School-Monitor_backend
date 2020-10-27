class Neighborhood < ApplicationRecord
  has_many :schools, :dependent => :destroy
  belongs_to :borough
end
