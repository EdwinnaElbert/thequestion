require 'rails_helper'

RSpec.describe "corrections/index", type: :view do
  before(:each) do
    assign(:corrections, [
      Correction.create!(),
      Correction.create!()
    ])
  end

  it "renders a list of corrections" do
    render
  end
end
