require 'rails_helper'

RSpec.describe Attachment, type: :model do
  let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example-2.csv'), 'text/csv') }
  subject(:resource) { Attachment.new file: file }

  describe '#url' do
    it 'returns url' do
      expect(resource.url).to match 'example-2.csv'
    end
  end

  describe '#file_name' do
    it 'returns file name' do
      expect(resource.file_name).to eq 'example-2.csv'
    end
  end

  describe '#content_type' do
    it 'returns content type' do
      expect(resource.content_type).to eq 'text/csv'
    end
  end
end
