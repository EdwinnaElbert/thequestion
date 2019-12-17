require 'rails_helper'

RSpec.describe "diffs/index", type: :view do
  before(:each) do
    assign(:diffs, [
      Diff.create!(),
      Diff.create!()
    ])
  end

  it "renders a list of diffs" do
    render
  end
end
