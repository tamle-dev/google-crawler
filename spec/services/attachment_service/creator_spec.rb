require 'rails_helper'

describe AttachmentService::Creator do
  let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example-2.csv'), 'text/csv') }
  let(:params) do
    {
      file: file
    }
  end

  subject { described_class.new(params) }

  before do
    allow_any_instance_of(AttachmentService::Reader).to receive(:exec)
  end

  it 'increases Attachment count' do
    expect{ subject.exec }.to change{ Attachment.count }.by(1)
  end

  it 'calls AttachmentService::Reader' do
    expect_any_instance_of(AttachmentService::Reader).to receive(:exec)

    subject.exec
  end
end
