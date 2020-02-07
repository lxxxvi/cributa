require "./cributa/row"
require "./cributa/table"

module Cributa
  VERSION = "0.1.0"

  def self.load
    Cributa::Loader.call
  end
  # TODO: Put your code here
end
