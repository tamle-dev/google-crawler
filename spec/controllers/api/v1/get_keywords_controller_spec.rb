require 'rails_helper'

describe Api::V1::GetKeywordsController, type: :request do
  describe 'get /api/v1/keywords' do
    include_context 'api_auth'
    let(:file)        { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example-2.csv'), 'text/csv') }
    let(:attachment)  { Attachment.create file:file, user_id: current_user_id }

    let(:action) { get '/api/v1/keywords', headers: headers }

    context 'when success' do
      before do
        keyword = Keyword.create value: 'facebook', total_adword: 1, total_url: 10, total_result: 8989000, total_result_time: 450, keyword_attachment_id: attachment.id
        KeywordDetail.create title: 'FacebookTitle', description: 'Facebook Description', url: 'https://facebook.com/login', domain: 'htpps://facebook.com', position: 1, keyword_id: keyword.id
      end

      it 'responds status 200' do
        action
        expect(response.status).to eq 200

        json = JSON.parse(response.body)
        expect(json).to have_key 'data'
        expect(json['data'].count).to eq 1
        expect(json['data'][0]).to have_key 'id'
        expect(json['data'][0]).to have_key 'created_at'
        expect(json['data'][0]).to have_key 'updated_at'
        expect(json['data'][0]).to have_key 'value'
        expect(json['data'][0]).to have_key 'total_adword'
        expect(json['data'][0]).to have_key 'total_url'
        expect(json['data'][0]).to have_key 'total_result'
        expect(json['data'][0]).to have_key 'total_result_time'
        expect(json['data'][0]).to have_key 'total_result_text'
        expect(json['data'][0]).to have_key 'total_result_time_text'
        expect(json['data'][0]).to have_key 'details'
        expect(json['data'][0]['details'][0]).to have_key 'id'
        expect(json['data'][0]['details'][0]).to have_key 'created_at'
        expect(json['data'][0]['details'][0]).to have_key 'updated_at'
        expect(json['data'][0]['details'][0]).to have_key 'title'
        expect(json['data'][0]['details'][0]).to have_key 'description'
        expect(json['data'][0]['details'][0]).to have_key 'url'
        expect(json['data'][0]['details'][0]).to have_key 'domain'
        expect(json['data'][0]['details'][0]).to have_key 'position'

        expect(json).to have_key 'paging'
        expect(json['paging']).to have_key 'current_page'
        expect(json['paging']).to have_key 'prev_page'
        expect(json['paging']).to have_key 'next_page'
        expect(json['paging']).to have_key 'total_count'
        expect(json['paging']).to have_key 'total_pages'
      end
    end
  end
end
