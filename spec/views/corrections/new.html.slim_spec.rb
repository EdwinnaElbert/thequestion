require 'rails_helper'

RSpec.describe "corrections/new", type: :view do
  before(:each) do
    assign(:correction, Correction.new())
  end

  it "renders new correction form" do
    render

    assert_select "form[action=?][method=?]", corrections_path, "post" do
    end
  end
end
