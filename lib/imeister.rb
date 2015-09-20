require 'imeister/version'
require 'imeister/warranty_status'
require 'imeister/constants'

module Imeister
  class << self
    def find(imei)
      return 'Invalid IMEI number' unless imei_valid?(imei)

      WarrantyStatus.new(imei).call
    end

    private

    def imei_valid?(imei)
      return false if imei.nil?
      imei.length > 0 && !imei.match(VALID_IMEI_REGEXP).nil?
    end
  end
end
