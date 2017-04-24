class PinsChannel < ApplicationCable::Channel

  def subscribed
    stream_from "pins_channel"
    logger.add_tags 'ActionCable', "User connected to pins channel"
  end

  def unsubscribed
  end
end
