class User < ApplicationRecord
  has_many :turnouts
  enum role: [:user, :moderator, :admin]
end
