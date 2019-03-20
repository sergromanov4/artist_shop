class Order < ApplicationRecord
    belongs_to :status
    belongs_to :user
    has_many :messages, dependent: :destroy

    mount_uploader :painted_picture, PictureUploader
    mount_uploader :image_for_order, ImageUploader

end
