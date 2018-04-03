class Question < ApplicationRecord
  belongs_to :quiz
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, reject_if: lambda { |attributes| attributes['body'].blank? }, allow_destroy: true
end
