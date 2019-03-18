class Order < ApplicationRecord
    belongs_to :status

    mount_uploader :image_for_order, ImageUploader
end
