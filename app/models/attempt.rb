class Attempt < ApplicationRecord
  belongs_to :user
  serialize :answers, Array
end
