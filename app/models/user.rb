class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # mount_uploader :carrierwave用に作ったカラム名, carrierwaveの設定ファイルのクラス名を関連づける
  mount_uploader :image, ImagesUploader

  has_many :post_images, dependent: :destroy
  belongs_to :group
end