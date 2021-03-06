class StatusScraper
  CONDITIONS_URL = 'https://www.nps.gov/yose/planyourvisit/conditions.htm'
  XPATH_STRING = '//*[@id="cs_control_5394476"]/div/div/table/tbody/tr[1]/td[5]/h3/span'

  class << self
    def execute!
      req = HTTP.get(CONDITIONS_URL)

      repo = StatusCheckRepository.new

      repo.create(
        status: req_to_status(req),
        response_html: req.to_s
      )

      repo.clear_old_statuses!
    end

    private

    def req_to_status(req)
      if req.code == 200
        cell_text = Oga.parse_html(req.to_s).xpath(XPATH_STRING).first.text
        normalize_status(cell_text)
      else
        'error'
      end
    end

    def normalize_status(cell_text)
      cell_text = cell_text.strip.downcase

      if cell_text.in?(StatusCheck::STATUS_OPTIONS)
        cell_text
      else
        'error'
      end
    end
  end
end
