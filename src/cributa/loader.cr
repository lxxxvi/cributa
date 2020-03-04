module Cributa
  class Loader
    getter table : Cributa::Table

    def load
      @table ||= Cributa::EstvPage.to_cributa_table
    end
  end
end
