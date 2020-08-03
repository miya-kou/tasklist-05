class Task < ApplicationRecord
  validates :meter, presence: true
  
  belongs_to :user
end
