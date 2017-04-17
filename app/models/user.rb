class User < ApplicationRecord
  has_many :turnouts
  enum role: [:user, :moderator, :admin]
  mount_uploader :image, ImageUploader
  has_secure_password
end
