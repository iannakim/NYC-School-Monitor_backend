class Option < ApplicationRecord
  belongs_to :program
  has_many :joiners, :dependent => :destroy
end
