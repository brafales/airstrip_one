require 'spec_helper'
require_relative '../../../../apps/telegram_api/controllers/home/update'

describe TelegramApi::Controllers::Home::Update do
  let(:action) { TelegramApi::Controllers::Home::Update.new }
  let(:params) { Hash[] }

  it "is successful" do
    response = action.call(params)
    response[0].must_equal 200
  end
end
