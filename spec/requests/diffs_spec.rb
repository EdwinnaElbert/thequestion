require 'rails_helper'

RSpec.describe "Diffs", type: :request do
  describe "GET /diffs" do
    it "works! (now write some real specs)" do
      get diffs_path
      expect(response).to have_http_status(200)
    end
  end
end
