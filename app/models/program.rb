class Program < ApplicationRecord
  has_many :options, :dependent => :destroy
end
