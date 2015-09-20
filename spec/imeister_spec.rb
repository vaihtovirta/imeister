# coding: utf-8
require 'spec_helper'

describe Imeister, vcr: true do
  let(:active_device) do
    VCR.use_cassette('active_device') { Imeister.find('013977000323877') }
  end
  let(:expired_device) do
    VCR.use_cassette('expired_device') { Imeister.find('013896000639712') }
  end

  describe 'find by valid imei' do
    it 'returns expiration date and warranty status' do
      expect(active_device.in_warranty).to be true
      expect(active_device.expiration_date.is_a? Date).to be true
      expect(active_device.expiration_date.day).to eq 10
      expect(active_device.expiration_date.month).to eq 8
      expect(active_device.expiration_date.year).to eq 2016
    end

    it 'returns message about warranty overdue' do
      expect(expired_device.in_warranty).to be false
    end
  end

  describe 'invalid imei' do
    it 'throw error message with blank imei' do
      result = Imeister.find('')
      expect(result).to eq 'Invalid IMEI number'
    end

    it 'throw error message with no imei' do
      result = Imeister.find(nil)
      expect(result).to eq 'Invalid IMEI number'
    end

    it 'throw error message with short imei' do
      result = Imeister.find('0138960006397')
      expect(result).to eq 'Invalid IMEI number'
    end

    it 'throw error message with too long imei' do
      result = Imeister.find('01389600063973213232321')
      expect(result).to eq 'Invalid IMEI number'
    end

    it 'throw error message with wrong chars in imei' do
      result = Imeister.find('%13977ZXC32387+')
      expect(result).to eq 'Invalid IMEI number'
    end
  end
end
