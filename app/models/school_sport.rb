class SchoolSport < ApplicationRecord
  has_many :sses, :dependent => :destroy
end
