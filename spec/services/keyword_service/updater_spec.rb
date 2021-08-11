require 'rails_helper'

describe ::KeywordService::Updater do
  let(:resource) { Keyword.new total_adword: nil }
  let(:params) do
    {
      total_adword: 7
    }
  end

  subject { described_class.new(resource, params) }

  describe '#exec' do
    it 'updates resource' do
      subject.exec

      resource.reload
      expect(resource.total_adword).to eq 7
    end

    it 'returns an Keyword' do
      result = subject.exec

      expect(result).to be_a Keyword
    end
  end
end
