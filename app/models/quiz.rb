class Quiz < ApplicationRecord
  validates :title, presence: true
  has_many :questions, dependent: :destroy
  has_many :attempts
  accepts_nested_attributes_for :questions, reject_if: lambda { |attributes| attributes['title'].blank? }, allow_destroy: true
  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end
end
