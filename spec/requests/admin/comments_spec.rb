require 'rails_helper'

RSpec.describe 'Admin::Comments', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/admin/comments/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/admin/comments/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/admin/comments/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/admin/comments/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
