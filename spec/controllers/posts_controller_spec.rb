require "rails_helper"

RSpec.describe Api::V1::PostsController, type: :controller do
  describe "POST#create" do
    let!(:floof_test) { Floof.create(
      name: "Cuddles",
      floofiness: 5,
      image: "https://media.giphy.com/media/r6ALgGVKLg93O/giphy.gif"
    ) }

    it "creates a new floof post" do
      post_json = {
        body: 'Floofs are amazing',
        floof_id: floof_test.id
      }.to_json

      post(:create, body: post_json)
      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["body"]).to eq ("Floofs are amazing")
      expect(returned_json["floof_id"]).to eq (floof_test.id)

    end
    # We'll add another it block here soon!
  end
end
