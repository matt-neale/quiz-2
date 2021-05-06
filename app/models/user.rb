class User < ApplicationRecord
  has_secure_password

  has_many :ideas, dependent: :nullify

  def full_name
    "#{first_name} #{last_name}"
  end
end
