require 'imeister/version'

module Imeister
  WARRANTY_URL = 'https://selfsolve.apple.com/agreementWarrantyDynamic.do'
  WARRANTY_FORM_ID = 'serialnumbercheck'
  IMEI = '013977000323877'
  module_function

  def warranty(imei_number = '013977000323877')
    browser = Watir::Browser.new
    browser.goto WARRANTY_URL
    browser.text_field(:name,'sn').set(IMEI)
    browser.hiddens(:name, 'num').last.set('123123')
    browser.form(:id, WARRANTY_FORM_ID).submit
    hardware_div = browser.div(id: 'hardware')
    if hardware_div.class_name == 'status green'
      div(id: 'hardware').p.text.match('Estimated Expiration Date:.*$').to_s
    elsif hardware_div.class_name == 'status yellow'
      puts 'Warranty has been expired'
    else
      puts 'Error'
    end
  end
end
