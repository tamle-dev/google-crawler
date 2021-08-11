require 'rails_helper'

RSpec.describe Keyword, type: :model do
  describe '#total_result_text' do
    let(:resource) { described_class.new total_result: 8998000 }

    it 'returns a string' do
      expect(resource.total_result_text).to eq '8,998,000'
    end
  end

  describe '#total_result_time_text' do
    let(:resource) { described_class.new total_result_time: 450 }

    it 'returns a string' do
      expect(resource.total_result_time_text).to eq '0.45 seconds'
    end
  end
end
