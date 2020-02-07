require "http/client"

module Cributa
  class EstvPage
    URL = "http://www.estv2.admin.ch/steuerfuss/my_select_alle.php"

    def to_cributa_table
      wip
    end

    def wip
      response = HTTP::Client.get URL
      html_table = response.body[/<table class=.rahmen. width=.950.>(.*)<\/table><BR><BR>/i].gsub(/<br><br>/i, "")
    end
  end
end
