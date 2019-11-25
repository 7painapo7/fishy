class Group < ApplicationRecord
	validates :group_name, presence: true
	has_many :users
	has_many :regulations
end
