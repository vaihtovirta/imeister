require 'imeister/version'
require 'imeister/checker'
require 'imeister/parser'

module Imeister
  IMEI = '013977000323877'
  class Finder
    def initialize(imei)
      @imei = imei
    end

    def find
      Imeister::Parser.new(@imei).submit
    end
  end
end
