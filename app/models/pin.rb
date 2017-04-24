class Pin < ApplicationRecord
  belongs_to :user

  def total_pins
    pins.pluck(:amount).sum
  end

end
