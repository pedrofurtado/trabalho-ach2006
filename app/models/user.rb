class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :validatable, :timeoutable, :registerable, :confirmable

  validates :email, uniqueness: true
end
