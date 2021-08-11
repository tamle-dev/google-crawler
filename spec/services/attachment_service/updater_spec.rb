require 'rails_helper'

describe ::AttachmentService::Updater do
  let(:resource) { Attachment.new status: :pending }
  let(:params) do
    {
      status: :completed
    }
  end

  subject { described_class.new(resource, params) }

  describe '#exec' do
    it 'updates resource' do
      subject.exec

      resource.reload
      expect(resource.status).to eq 'completed'
    end

    it 'returns an Attachment' do
      result = subject.exec

      expect(result).to be_a Attachment
    end
  end
end
