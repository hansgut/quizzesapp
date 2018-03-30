class Determination < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
