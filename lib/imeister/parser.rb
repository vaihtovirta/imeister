require 'watir-webdriver'

module Imeister
  class Parser
    WARRANTY_URL = 'https://selfsolve.apple.com/wcResults.do'
    HARDWARE_DIV_ID = 'hardware'
    VALID_IMEI_REGEXP = '^\d{15}*$'
    SN_FIELD = 'sn'
    NUM_FIELD = 'num'

    def initialize(imei = '')
      @imei = imei.to_s
    end

    def submit
      return 'Invalid IMEI number' unless imei_valid?
      browser
    end

    def browser
      browser = Watir::Browser.start warranty_url, :phantomjs
      hardware_div = browser.div(id: HARDWARE_DIV_ID)
      check = Imeister::Checker.new(hardware_div)
      result = check.warranty
      browser.close
      result
    end

    def imei_valid?
      @imei.length > 0 && !@imei.match(VALID_IMEI_REGEXP).nil?
    end

    def warranty_url
      "#{WARRANTY_URL}?sn=#{@imei}&num=#{rand(999_999)}"
    end
  end
end
