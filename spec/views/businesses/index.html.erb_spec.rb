require 'rails_helper'

RSpec.describe "businesses/index", type: :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        name: "Name",
        nit: "Nit",
        owner: "Owner",
        country: "Country",
        city: "City",
        telephone: "Telephone",
        email: "Email"
      ),
      Business.create!(
        name: "Name",
        nit: "Nit",
        owner: "Owner",
        country: "Country",
        city: "City",
        telephone: "Telephone",
        email: "Email"
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Nit".to_s, count: 2
    assert_select "tr>td", text: "Owner".to_s, count: 2
    assert_select "tr>td", text: "Country".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Telephone".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
