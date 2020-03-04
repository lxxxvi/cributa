require "./cributa/estv_page"
require "./cributa/row"
require "./cributa/table"
require "./cributa/loader"

module Cributa
  VERSION = "0.1.0"

  def self.load
    Cributa::Loader.new.load
  end
end
