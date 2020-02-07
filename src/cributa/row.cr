module Cributa
  class Row
    getter canton : String
    getter year : String
    getter community : String
    getter canton_rate : String
    getter community_rate : String
    getter reformed_rate : String
    getter catholic_rate : String

    def initialize(columns : Array)
      @canton, @year, @community, @canton_rate, @community_rate, @reformed_rate, @catholic_rate = columns
    end
  end
end
