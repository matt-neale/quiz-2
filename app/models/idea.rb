class Idea < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user

  has_many :likes
  has_many :likers, through: :likes, source: :user

  # before_save :capitalize_title <----- this was making it so multiple of the same title could be saved?

  validates :title, presence: {message: "Must be given"}, uniqueness: true
  validates :description, presence: true

  

  private

  def capitalize_title
    self.title.capitalize!
  end

end
