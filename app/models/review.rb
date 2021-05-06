class Review < ApplicationRecord

  belongs_to :idea
  belongs_to :user

  validates :body, presence: {message: 'Please enter review body'}

end
