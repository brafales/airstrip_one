require 'spec_helper'
require_relative '../../../../apps/telegram_api/views/home/update'

describe TelegramApi::Views::Home::Update do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Lotus::View::Template.new('apps/telegram_api/templates/home/update.html.erb') }
  let(:view)      { TelegramApi::Views::Home::Update.new(template, exposures) }
  let(:rendered)  { view.render }

  it "exposes #foo" do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
