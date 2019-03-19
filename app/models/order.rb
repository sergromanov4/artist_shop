class Order < ApplicationRecord
    belongs_to :status
    belongs_to :user
    has_many :messages

    mount_uploader :painted_picture, PictureUploader
    mount_uploader :image_for_order, ImageUploader

end
