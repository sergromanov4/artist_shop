class Order < ApplicationRecord
    belongs_to :status
    belongs_to :user

    mount_uploader :image_for_order, ImageUploader
end
