class List < ApplicationRecord
  belongs_to :project
  enum status: { incomplete: 0, complete: 1 }
end
