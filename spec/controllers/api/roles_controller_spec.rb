# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::RolesController, type: :controller do
  describe 'POST #create' do
    let(:valid_attributes) { { role: { name: 'Developer' } } }
    let(:invalid_attributes) { { role: { name: '' } } }

    context 'with valid params' do
      it 'creates a new role' do
        expect {
          post :create, params: valid_attributes
        }.to change(Role, :count).by(1)
      end

      it 'returns a JSON response with the new role' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)['name']).to eq('Developer')
      end
    end

    context 'with invalid params' do
      it 'returns a JSON response with errors for the new role' do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(JSON.parse(response.body)).to include('name')
      end
    end
  end
end
