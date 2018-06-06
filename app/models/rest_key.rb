class RestKey < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :key, presence: true, uniqueness: true
end
