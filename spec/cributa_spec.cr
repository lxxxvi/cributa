require "./spec_helper"

def example_rows
  {
    :aarau      => ["AG", "2000", "Aarau", "10.00", "20.00", "30.00", "40.00"],
    :frauenfeld => ["TG", "2008", "Frauenfeld", "5.00", "6.00", "7.00", "8.00"],
  }
end

describe Cributa do
  it "creates a table" do
    example_cributa_rows = example_rows.values.map do |columns|
      Cributa::Row.new(columns)
    end
    table = Cributa::Table.new(example_cributa_rows)

    table.rows.size.should eq(2)
  end

  it "parses a row" do
    row = Cributa::Row.new(example_rows[:aarau])

    row.canton.should be("AG")
    row.year.should be("2000")
    row.community.should be("Aarau")
    row.canton_rate.should be("10.00")
    row.community_rate.should be("20.00")
    row.reformed_rate.should be("30.00")
    row.catholic_rate.should be("40.00")
  end
end
