require 'rails_helper'

describe "after creation" do
  it "sends a confirmation email" do
    user = FactoryBot.create(:user)

    expect { user.save }.to change(
        Devise.mailer.deliveries, :count
    ).by(1)
  end
 end
