class Answer < ApplicationRecord
  attribute :atrue, :boolean, default: false
  belongs_to :question
end
