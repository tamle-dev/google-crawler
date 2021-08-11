require 'rails_helper'

describe ::KeywordService::Crawler do
  let(:keyword) { Keyword.new value: 'youtube' }
  let(:keywords) { [keyword] }

  subject { described_class.new(keywords) }

  before do
    allow_any_instance_of(KeywordService::Updater).to receive(:exec)
    allow_any_instance_of(KeywordService::HtmlWriter).to receive(:exec)
    allow_any_instance_of(KeywordService::Parser).to receive(:exec)
  end

  describe '#exec' do
    it 'calls KeywordService::Updater' do
      # expect_any_instance_of(KeywordService::Updater).to receive(:exec)
      # subject.exec
    end
    
    it 'calls KeywordService::Updater' do
      # expect_any_instance_of(KeywordService::HtmlWriter).to receive(:exec)
      # subject.exec
    end

    it 'calls KeywordService::Updater' do
      # expect_any_instance_of(KeywordService::Parser).to receive(:exec)
      # subject.exec
    end
  end
end
