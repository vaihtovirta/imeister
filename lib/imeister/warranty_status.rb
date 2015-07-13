require 'faraday'
require_relative 'constants'

module Imeister
  class WarrantyStatus
    attr_reader :warranty_status, :expiration_date

    def initialize(imei = '')
      @imei = imei
      @warranty_status = nil
      @expiration_date = nil
      info
    end

    def info
      if status == 'true'
        @warranty_status = 'In warranty'
        @expiration_date = response.body.match(EXPIRATION_DATE_REGEXP)[1]
      else
        @warranty_status = 'Out of warranty'
      end
    end

    private

    def status
      response.body.match(STATUS_REGEXP)[1]
    end

    def connection
      Faraday.new(url: WARRANTY_URL) do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end

    def response
      connection.post RESULTS_URL, sn: @imei, num: rand(999_999)
    end
  end
end
