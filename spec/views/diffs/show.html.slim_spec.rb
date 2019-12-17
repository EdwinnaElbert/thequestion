require 'rails_helper'

RSpec.describe "diffs/show", type: :view do
  before(:each) do
    @diff = assign(:diff, Diff.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
