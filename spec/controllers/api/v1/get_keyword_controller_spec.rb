require 'rails_helper'

describe Api::V1::GetKeywordController, type: :request do
  describe 'get /api/v1/keywords/:keyword_id' do
    include_context 'api_auth'

    let(:file)            { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'example-2.csv'), 'text/csv') }
    let(:attachment)      { Attachment.create file:file, user_id: current_user_id }
    let(:keyword_detail)  { KeywordDetail.create title: 'FacebookTitle', description: 'Facebook Description', url: 'https://facebook.com/login', domain: 'htpps://facebook.com', position: 1 }
    let(:keyword)         { Keyword.create value: 'facebook', total_adword: 1, total_url: 10, total_result: 8989000, total_result_time: 450, keyword_attachment_id: attachment.id, keyword_details: [keyword_detail] }
    let(:keyword_id)      { keyword.id }

    let(:action) { get "/api/v1/keywords/#{keyword_id}", headers: headers }

    context 'when success' do
      it 'responds keyword' do
        action
        expect(response.status).to eq 200

        json = JSON.parse(response.body)
        expect(json).to have_key 'data'
        expect(json['data']).to have_key 'id'
        expect(json['data']).to have_key 'created_at'
        expect(json['data']).to have_key 'updated_at'
        expect(json['data']).to have_key 'value'
        expect(json['data']).to have_key 'total_adword'
        expect(json['data']).to have_key 'total_url'
        expect(json['data']).to have_key 'total_result'
        expect(json['data']).to have_key 'total_result_time'
        expect(json['data']).to have_key 'total_result_text'
        expect(json['data']).to have_key 'total_result_time_text'
        expect(json['data']).to have_key 'details'
        expect(json['data']['details'][0]).to have_key 'id'
        expect(json['data']['details'][0]).to have_key 'created_at'
        expect(json['data']['details'][0]).to have_key 'updated_at'
        expect(json['data']['details'][0]).to have_key 'title'
        expect(json['data']['details'][0]).to have_key 'description'
        expect(json['data']['details'][0]).to have_key 'url'
        expect(json['data']['details'][0]).to have_key 'domain'
        expect(json['data']['details'][0]).to have_key 'position'
      end
    end

    context 'when error' do
      context 'when invalid keyword_id' do
        let(:keyword_id) { 'invalidID' }
  
        it 'responds status 400' do
          action
          expect(response.status).to eq 400
        end
      end

      context 'when current_user is not owner' do
        let(:current_user_id) { 'invalidID' }

        it 'responds status 400' do
          action
          expect(response.status).to eq 400
        end
      end
    end
  end
end
