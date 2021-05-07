class User < ApplicationRecord
  has_secure_password

  has_many :ideas, dependent: :nullify
  has_many :reviews, dependent: :nullify

  has_many :likes 
  has_many :liked_ideas, through: :likes, source: :idea

  def full_name
    "#{first_name} #{last_name}"
  end
end
