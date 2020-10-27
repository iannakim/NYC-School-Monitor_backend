class EllProgram < ApplicationRecord
  has_many :ses, :dependent => :destroy
end
