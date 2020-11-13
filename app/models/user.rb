class User < ApplicationRecord
  has_many :reviews, :dependent => :destroy
  has_many :saveds, :dependent => :destroy

  has_secure_password
  validates :username, :email, :password, :role, presence: true
  validates :username, :email, uniqueness: true
  validates :password, length: { in: 5..10 }

end
