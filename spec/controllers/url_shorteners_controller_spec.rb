require 'rails_helper'
#testing API's
describe Api::V1::Features::UrlShortenersController, type: :controller do
  context 'GET #index' do
    it 'returns HTTP status 200' do
      get :index
      expect(response).to have_http_status 200
    end
  end

  context 'GET #show' do
    let(:shortened_url) { create(:shortened_url) }
    it 'not returns HTTP status 200' do
      get :show, params: { unique_key: 'ekyhh2' }
      expect(response).not_to have_http_status 200
    end

    it 'returns HTTP status 200' do
      get :show, params: { unique_key: shortened_url.unique_key }
      expect(response).to have_http_status 200
    end
  end

  context 'POST create' do
    it "with valid attributes" do
      post :create, params: { url_shortener: { url: 'zipgo.in'} }
      expect(response).to have_http_status 200
    end
  end

  context 'DELETE url' do
    let(:shortened_url) { create(:shortened_url) }
    it 'successfully deleted with key present' do
      delete :destroy, params: {unique_key: shortened_url.unique_key }
      expect(eval(response.body)[:message]).to eq("Successfully Deleted")
    end
  end

end