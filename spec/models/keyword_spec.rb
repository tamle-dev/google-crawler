require 'rails_helper'

RSpec.describe Keyword, type: :model do
  describe '#total_result_text' do
    let(:total_result)  { 8998000 }
    let(:resource)      { described_class.new total_result: total_result }

    it 'returns a string' do
      expect(resource.total_result_text).to eq '8,998,000'
    end

    context 'when total_result be nil' do
      let(:total_result)  { nil }

      it 'returns nil' do
        expect(resource.total_result_text).to be_nil
      end
    end
  end

  describe '#total_result_time_text' do
    let(:total_result_time) { 450 }
    let(:resource)          { described_class.new total_result_time: total_result_time }

    it 'returns a string' do
      expect(resource.total_result_time_text).to eq '0.45 seconds'
    end
    
    context 'when total_result_time be nil' do
      let(:total_result_time)  { nil }

      it 'returns nil' do
        expect(resource.total_result_time_text).to be_nil
      end
    end
  end
end
