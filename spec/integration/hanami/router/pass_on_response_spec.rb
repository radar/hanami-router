# frozen_string_literal: true

RSpec.describe "Pass on response" do
  let(:app) { Rack::MockRequest.new(routes) }
  let(:routes) do
    Hanami::Router.new { get "/", to: ->(*) { [200, {}, ["OK"]] } }
  end

  it "is successful" do
    response = app.get("/", lint: true)
    expect(response.status).to eq(200)
  end
end
