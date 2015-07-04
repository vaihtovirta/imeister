# coding: utf-8
require 'spec_helper'

describe Imeister do
  describe 'find by valid imei' do
    it 'returns expiration date' do
      valid_imei =  '013977000323877'
      result = Imeister.find(valid_imei)
      expect(result.warranty_status).to eq 'In warranty'
      expect(result.expiration_date).to eq 'August 10, 2016'
    end

    it 'returns message about warranty overdue' do
      valid_imei =  '013896000639712'
      result = Imeister.find(valid_imei)
      expect(result.warranty_status).to eq 'Out of warranty'
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
