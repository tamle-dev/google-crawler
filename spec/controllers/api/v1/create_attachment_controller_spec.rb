require 'rails_helper'

describe Api::V1::CreateAttachmentController, type: :request do
  describe 'post /api/v1/attachments' do
    include_context 'api_auth'

    let(:file)        { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example-2.csv'), 'text/csv') }
    let(:attachment)  { Attachment.create file: file }
    let(:params) do 
      { 
        file: file
      }
    end
    let(:action) { post '/api/v1/attachments', params: params, headers: headers }

    before do
      allow_any_instance_of(AttachmentService::Creator).to receive(:exec).and_return attachment
    end

    context 'when success' do
      it 'responds status 201' do
        action
        expect(response.status).to eq 201

        json = JSON.parse response.body
        expect(json).to have_key 'data'
        expect(json['data']).to have_key 'id'
        expect(json['data']).to have_key 'url'
      end

      it 'calls AttachmentService::Creator' do
        expect_any_instance_of(AttachmentService::Creator).to receive(:exec)

        action
      end
    end

    context 'when error' do
      context 'when file type is html' do
        let(:file) { Rack::Test::UploadedFile.new("#{Rails.root}/spec/fixtures/example.html", 'text/html') }

        it 'responds status 400' do
          action
          expect(response.status).to eq 400
        end
      end
    end
  end
end
