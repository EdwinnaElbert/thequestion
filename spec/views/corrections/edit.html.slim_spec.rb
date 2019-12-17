require 'rails_helper'

RSpec.describe "corrections/edit", type: :view do
  before(:each) do
    @correction = assign(:correction, Correction.create!())
  end

  it "renders the edit correction form" do
    render

    assert_select "form[action=?][method=?]", correction_path(@correction), "post" do
    end
  end
end
