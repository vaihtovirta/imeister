require 'imeister/version'
require 'extensions/watir'

module Imeister
  WARRANTY_URL = 'https://selfsolve.apple.com/agreementWarrantyDynamic.do'
  WARRANTY_FORM_ID = 'serialnumbercheck'
  IMEI = '013977000323877'
  module_function

  def warranty(imei_number = '013977000323877')
    browser = Watir::Browser.new :phantomjs
    browser.goto WARRANTY_URL
    browser.text_field(:name,'sn').set(imei_number)
    browser.form(:id, WARRANTY_FORM_ID).submit
    browser.div(id: 'harwdare').class_name
  end
end
