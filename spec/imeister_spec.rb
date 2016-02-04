# coding: utf-8
require 'spec_helper'

describe Imeister, vcr: true do
  INVALID_VALUES = ['', nil, '0138960006397', '01389600063973213232321', '%13977ZXC32387+']

  let(:active_device) do
    VCR.use_cassette('active_device') { described_class.find('013977000323877') }
  end
  let(:expired_device) do
    VCR.use_cassette('expired_device') { described_class.find('013896000639712') }
  end

  context 'when IMEI is valid' do
    context 'device with active warranty' do
      it { expect(active_device.in_warranty).to be true }
      it { expect(active_device.expiration_date.is_a? Date).to be true }
      it { expect(active_device.expiration_date.day).to eq 10 }
      it { expect(active_device.expiration_date.month).to eq 8 }
      it { expect(active_device.expiration_date.year).to eq 2016 }
    end

    context 'device with expired warranty' do
      it { expect(expired_device.in_warranty).to be false }
    end
  end

  context 'when IMEI is invalid' do
    let(:error_message) { 'Invalid IMEI number' }

    INVALID_VALUES.each do |invalid_imei|
      it { expect(described_class.find(invalid_imei)).to eq error_message }
    end
  end
end
