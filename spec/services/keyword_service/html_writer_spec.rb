require 'rails_helper'

describe ::KeywordService::HtmlWriter do
  let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example.html'), 'text/html') }
  let(:resource) { Keyword.new value: 'youtube' }
  let(:doc) { Nokogiri::HTML(File.open(file)) }

  subject { described_class.new(resource, doc) }

  before do
    allow_any_instance_of(KeywordService::Updater).to receive(:exec)
  end

  describe '#exec' do
    it 'increases Attachment count' do
      expect{ subject.exec }.to change{ Attachment.count }.by(1)
    end

    it 'calls KeywordService::Updater' do
      expect_any_instance_of(KeywordService::Updater).to receive(:exec)

      subject.exec
    end
  end
end
