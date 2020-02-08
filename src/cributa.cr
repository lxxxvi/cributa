require "./cributa/estv_page"
require "./cributa/row"
require "./cributa/table"

module Cributa
  VERSION = "0.1.0"

  def self.load
    Cributa::Loader.call
  end
end
