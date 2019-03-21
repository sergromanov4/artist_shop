class Order < ApplicationRecord
    include AASM

    belongs_to :status
    belongs_to :user
    has_many :messages, dependent: :destroy

    mount_uploader :painted_picture, PictureUploader
    mount_uploader :image_for_order, ImageUploader

  aasm column: 'state' do
   
    state :new, initial: true
    state :rated
    state :work
    state :check
    state :completed

    event :go_to_rated do
      transitions from: :new, to: :rated
    end

    event :go_to_work do
      transitions from: :rated, to: :work
    end

    event :go_to_check do
      transitions from: :work, to: :check
    end

    event :go_to_complited do
      transitions from: :check, to: :completed
    end

  end

  def state_to_work
    self.go_to_work!
  end

  def state_to_completed
    self.go_to_completed!
  end

end
