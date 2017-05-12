class Request < ApplicationRecord
  belongs_to :user

  enum role: [:pending, :completed, :rejected]
end
