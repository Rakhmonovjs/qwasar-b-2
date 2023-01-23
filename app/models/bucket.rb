class Bucket < ApplicationRecord
  belongs_to :project
  has_many :bucks, dependent: :destroy
end
