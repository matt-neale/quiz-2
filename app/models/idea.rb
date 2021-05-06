class Idea < ApplicationRecord

  belongs_to :user

  before_save :capitalize_title

  validates :title, presence: {message: "Must be given"}, uniqueness: true
  validates :description, presence: true

  

  private

  def capitalize_title
    self.title.capitalize!
  end

end
