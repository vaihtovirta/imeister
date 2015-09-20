require 'faraday'
require 'wannabe_bool'

module Imeister
  class WarrantyStatus
    attr_reader :in_warranty, :expiration_date

    def initialize(imei = '')
      @imei = imei
      @in_warranty = false
      @expiration_date = nil
      @response = response
    end

    def call
      if status
        @in_warranty = true
        @expiration_date = check_expiration_date
      end

      self
    end

    private

    def check_expiration_date
      Date.parse @response.body.match(EXPIRATION_DATE_REGEXP)[1]
    end

    def status
      @response.body.match(STATUS_REGEXP)[1].to_b
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
