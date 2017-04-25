class User < ApplicationRecord
  has_many :turnouts
  has_many :pins
  has_many :cashes

  enum role: [:user, :moderator, :admin]
  mount_uploader :image, ImageUploader
  has_secure_password

  validates :username, presence: true,
                       uniqueness: true

  def total_pins
    pins.pluck(:amount).sum
  end

end
