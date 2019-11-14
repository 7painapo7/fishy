class Regulation < ApplicationRecord
  validates :end_time , presence: true
  belongs_to :group
end
