class User < ApplicationRecord
  has_many :turnouts
  has_many :pins
  has_many :cashes
  has_many :providehelps
  has_many :gethelps
  has_many :requests

  enum role: [:user, :moderator, :admin]
  mount_uploader :image, ImageUploader
  has_secure_password

  validates :username, presence: true,
                       uniqueness: true

  def total_pins
    pins.pluck(:amount).sum
  end

  def total_cashes
    cashes.pluck(:amount).sum
  end

end
