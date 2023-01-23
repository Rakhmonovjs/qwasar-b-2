class Project < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true

  has_many :buckets, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :documents, dependent: :destroy
end
