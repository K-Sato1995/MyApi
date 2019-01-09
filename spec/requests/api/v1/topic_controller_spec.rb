require 'rails_helper'
# [Rails API Testing Best Practices] (https://matthewlehner.net/rails-api-testing-guidelines)

describe 'TopicAPI' do
  context 'When Api works successfully' do
    let(:valid_params) do
      { topic: {title: 'title'} }
    end

    it 'sends a list of topics' do
      2.times { create(:topic) }

      get '/api/v1/topics'
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['status']).to eq('SUCCESS')
      expect(json['data'].length).to eq(2)
    end

    it 'sends a specific topic' do
      topic = create(:topic, title: 'test-title')

      get "/api/v1/topics/#{topic.id}"
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['title']).to eq(topic.title)
    end

    it 'creates a new topic' do
      expect { post '/api/v1/topics', params: valid_params}.to change(Topic, :count).by(+1)
      expect(response.status).to eq(200)
    end

    it 'delets a post' do
      topic = create(:topic, title: 'test-title')

      expect { delete "/api/v1/topics/#{topic.id}" }.to change(Topic, :count).by(-1)
      expect(response.status).to eq(200)
    end

    it 'updates a post' do
      topic = create(:topic, title: 'old-title')

      put "/api/v1/topics/#{topic.id}", params: valid_params
      json = JSON.parse(response.body)

      expect(response.status).to eq(200)
      expect(json['data']['title']).to eq('title')
    end
  end

  context 'When the Api does not work successfully' do
  end
end
