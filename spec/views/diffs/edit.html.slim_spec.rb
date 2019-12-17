require 'rails_helper'

RSpec.describe "diffs/edit", type: :view do
  before(:each) do
    @diff = assign(:diff, Diff.create!())
  end

  it "renders the edit diff form" do
    render

    assert_select "form[action=?][method=?]", diff_path(@diff), "post" do
    end
  end
end
