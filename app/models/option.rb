class Option < ApplicationRecord
  belongs_to :Program
  has_many :joiners, :dependent => :destroy
end
