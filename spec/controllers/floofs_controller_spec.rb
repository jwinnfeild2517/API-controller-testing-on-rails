require "rails_helper"

RSpec.describe Api::V1::FloofsController, type: :controller do
  let!(:floof_test) { Floof.create(
    name: "Cuddles",
    floofiness: 5,
    image: "https://media.giphy.com/media/r6ALgGVKLg93O/giphy.gif"
  ) }

  describe "GET#show" do
    it "should returned the floof with matching id" do

      get :show, params: { id: floof_test.id }
      returned_json = JSON.parse(response.body)

      # More code to come!
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 2
      expect(returned_json['floof']['name']).to eq ('Cuddles')
      expect(returned_json['floof']['floofiness']).to eq (5)
      expect(returned_json['floof']['image']).to eq ('https://media.giphy.com/media/r6ALgGVKLg93O/giphy.gif')
    end
  end
end
