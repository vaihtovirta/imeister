require 'imeister/version'
require 'imeister/checker'
require 'imeister/parser'

module Imeister
  class << self
    def find(imei)
      Imeister::Parser.new(imei).submit
    end
  end
end
