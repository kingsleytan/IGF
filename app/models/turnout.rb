class Turnout < ApplicationRecord
  belongs_to :user
  enum location: [:Midvalley_Boulevard, :PJ, :Others]
end
