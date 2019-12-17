require 'rails_helper'

RSpec.describe "corrections/show", type: :view do
  before(:each) do
    @correction = assign(:correction, Correction.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
