class PostImage < ApplicationRecord
    belongs_to :user

    mount_uploader :fish_image, ImagesUploader
end
