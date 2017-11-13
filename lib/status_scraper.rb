class StatusScraper
  XPATH_STRING = '//*[@id="cs_control_5394476"]/div/div[2]/table/tbody/tr[1]/td[5]/h3/span'

  def self.execute!
    html_string = HTTP.get('https://www.nps.gov/yose/planyourvisit/conditions.htm').to_s
    doc = Oga.parse_html(html_string)
    is_open = doc.xpath(XPATH_STRING).first.text == 'Open'

    StatusCheckRepository.new.create(
      is_open: is_open,
      response_html: html_string
    )
  end
end
