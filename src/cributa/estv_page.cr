require "http/client"
require "xml"

module Cributa
  class EstvPage
    URL = "http://www.estv2.admin.ch/steuerfuss/my_select_alle.php"

    def to_cributa_table
      Cributa::Table.new(parse_rows)
    end

    def parse_rows
      tr_nodes = parse_table.xpath_nodes("/html/body/table/tr")

      puts "HERE"
      puts parse_table.class
      puts tr_nodes
      puts "THERE"

      rows = tr_nodes.map do |tr_node|
        columns = tr_node.xpath_nodes("td").map &.text
        Cributa::Row.new(columns)
      end
    end

    def parse_table
      @parse_table ||= XML.parse_html(load_and_prepare_html)
    end

    private def load_and_prepare_html
      response = HTTP::Client.get URL
      html_table = response.body[/<table class=.rahmen. width=.950.>(.*)<\/table><BR><BR>/i].gsub(/<br><br>/i, "")
    end
  end
end
