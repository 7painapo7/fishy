class PostImage < ApplicationRecord
	acts_as_paranoid
    belongs_to :user
    validates :fish_image, presence: true
    validates :fish_name, presence: true
    validates :count, presence: true
    validates :size, presence: true
    mount_uploader :fish_image, ImagesUploader
end
