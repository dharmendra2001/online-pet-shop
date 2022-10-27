require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  context "GET /index" do
    it "return a successful response" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  context "get /show" do
    it "return a successful response" do
      users = User.new(name: "Johns", email: "johns@g.com", password: "123456",confirmed_at: Time.now)
      user = users.save
      allow(request.env['warden']).to receive(:authenticate!).and_return(users)
      allow(controller).to receive(:current_user).and_return(users)
      get :show, params: {id: users.id}
      expect(response.status).to eq(200)
    end
  end

  context "get /balance" do
    it "balance" do 
      users = User.new(name: "Johns", email: "johns@g.com", password: "123456",confirmed_at: Time.now)
      user = users.save
      allow(request.env['warden']).to receive(:authenticate!).and_return(users)
      allow(controller).to receive(:current_user).and_return(users)
      get :balance, params: {id: users.id}
      expect(response.status).to eq(200)
    end
  end

  context "user destroy" do
    it "delete" do 
      users = User.new(name: "Johns", email: "johns@g.com", password: "123456",confirmed_at: Time.now)
      user = users.save
      delete :user_destroy, params: {id: users.id}
      expect(response.status).to eq(302)
    end
  end
end
