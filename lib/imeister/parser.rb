require 'watir-webdriver'
require 'extensions/watir'
require 'headless'

module Imeister
  class Parser
    WARRANTY_URL = 'https://selfsolve.apple.com/wcResults.do'
    HARDWARE_DIV_ID = 'hardware'
    VALID_IMEI_REGEXP = '^\d{15}*$'
    SN_FIELD = 'sn'
    NUM_FIELD = 'num'

    def initialize(imei = nil)
      @imei = imei
    end

    def submit
      return unless imei_valid?
      browser
    end

    def browser
      Headless.ly do
        browser = Watir::Browser.start warranty_url
        hardware_div = browser.div(id: HARDWARE_DIV_ID)
        check = Imeister::Checker.new(hardware_div)
        check.warranty
      end
    end

    def imei_valid?
      true unless @imei.nil? || @imei.match(VALID_IMEI_REGEXP).nil?
    end

    def warranty_url
      "#{WARRANTY_URL}?sn=#{@imei}&num=#{rand(999999)}"
    end
  end
end
