require "http/client"
require "xml"

module Cributa
  class EstvPage
    URL = "http://www.estv2.admin.ch/steuerfuss/my_select_alle.php"

    def to_cributa_table
      Cributa::Table.new(parse_rows)
    end

    def parse_rows
      parsed_table = XML.parse_html(html_table)
      tr_nodes = parsed_table.xpath_nodes("//table/tr")

      rows = tr_nodes.map do |tr_node|
        columns = tr_node.xpath_nodes("td").map &.text
        Cributa::Row.new(columns)
      end
    end

    private def load_and_prepare_html
      response = HTTP::Client.get URL
      html_table = response.body[/<table class=.rahmen. width=.950.>(.*)<\/table><BR><BR>/i].gsub(/<br><br>/i, "")
    end
  end
end
