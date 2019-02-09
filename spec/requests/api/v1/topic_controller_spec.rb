require 'rails_helper'
# [Rails API Testing Best Practices] (https://matthewlehner.net/rails-api-testing-guidelines)

describe 'PostAPI' do
  it 'sends a list of posts' do
    FactoryBot.create_list(:post, 10)

    get '/api/v1/posts'
    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json['status']).to eq('SUCCESS')
    expect(json['data'].length).to eq(2)
  end

  it 'sends a specific post' do
    post = create(:post, title: 'test-title')

    get "/api/v1/posts/#{post.id}"
    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json['data']['title']).to eq(post.title)
  end

  it 'creates a new post' do
    expect { post '/api/v1/posts', params: valid_params}.to change(Post, :count).by(+1)
    expect(response.status).to eq(200)
  end

  it 'delets a post' do
    post = create(:post, title: 'test-title')

    expect { delete "/api/v1/posts/#{post.id}" }.to change(Post, :count).by(-1)
    expect(response.status).to eq(200)
  end

  it 'updates a post' do
    post = create(:post, title: 'old-title')

    put "/api/v1/posts/#{post.id}", params: valid_params
    json = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(json['data']['title']).to eq('title')
  end
end
