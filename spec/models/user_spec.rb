require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation test" do
    it "ensure name is present" do 
      user = User.new(email: "john@g.com", password: "123456").save
      expect(user).to eq(false)
    end

    it "ensure email is present" do
      user = User.new(name: "John", password: "123456").save
      expect(user).to eq(false)
    end

    it "ensure password is present" do
      user = User.new(name: "John", email: "john@g.com").save
      expect(user).to eq(false)
    end

    it "successfully save" do
      user = User.new(name: "Johns", email: "johns@g.com", password: "123456",confirmed_at: Time.now).save
      expect(user).to eq(true)
    end
  end
  
end
