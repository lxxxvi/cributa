module Cributa
  class Table
    getter rows : Array(Cributa::Row)

    def initialize(@rows : Array(Cributa::Row))
    end
  end
end
