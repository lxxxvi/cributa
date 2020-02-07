require "./spec_helper"

describe Cributa do
  it "parses the page" do
    table = Cributa::Table.new
  end

  it "parses a row" do
    row = Cributa::Row.new(["AG", "2000", "Aarau", "10.00", "20.00", "30.00", "40.00"])

    row.canton.should be("AG")
    row.year.should be("2000")
    row.community.should be("Aarau")
    row.canton_rate.should be("10.00")
    row.community_rate.should be("20.00")
    row.reformed_rate.should be("30.00")
    row.catholic_rate.should be("40.00")
  end
end
