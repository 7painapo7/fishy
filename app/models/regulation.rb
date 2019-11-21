class Regulation < ApplicationRecord
  # validates :size, presence: true, length: { minimum: 3 },format: {/\A[0-9]+\z/}
  # validates :count, presence: true, length: { minimum: 3 },format: {/\A[0-9]+\z/}
  validates :end_time , presence: true
  belongs_to :group
end
