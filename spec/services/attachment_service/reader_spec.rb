require 'rails_helper'

describe AttachmentService::Reader do
  let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example-2.csv'), 'text/csv') }
  let(:attachment) { Attachment.new file:file }

  subject { described_class.new(attachment) }

  before do
    allow(Job::KeywordCrawler).to receive(:perform_later)

    allow_any_instance_of(AttachmentService::Updater).to receive(:exec)
  end

  it 'increases Keyword count' do
    subject.exec

    expect{ subject.exec }.to change{ Keyword.count }.by(10)
  end

  it 'calls AttachmentService::Updater' do
    expect_any_instance_of(AttachmentService::Updater).to receive(:exec)

    subject.exec
  end

  it 'calls Job::KeywordCrawler' do
    allow(Job::KeywordCrawler).to receive(:perform_later)

    subject.exec
  end
end
