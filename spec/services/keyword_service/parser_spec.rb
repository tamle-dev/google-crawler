require 'rails_helper'

describe ::KeywordService::Parser do
  let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example.html'), 'text/html') }
  let(:doc) { Nokogiri::HTML(File.open(file)) }

  subject { described_class.new(doc) }

  describe '#exec' do
    it 'returns right data' do
      result = subject.exec

      expect(result).to be_a Hash
      expect(result[:total_adword]).to eq 0
      expect(result[:total_url]).to eq 127
      expect(result[:total_result]).to eq 12360000000
      expect(result[:total_result_time]).to eq 600
      expect(result[:keyword_details_attributes]).to be_a Array
      expect(result[:keyword_details_attributes].size).to be 8
    end
  end
end
