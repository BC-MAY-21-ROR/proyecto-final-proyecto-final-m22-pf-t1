require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        dni: "Dni",
        full_name: "Full Name",
        telephone: "Telephone",
        birthday: "Birthday",
        email: "Email"
      ),
      Customer.create!(
        dni: "Dni",
        full_name: "Full Name",
        telephone: "Telephone",
        birthday: "Birthday",
        email: "Email"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", text: "Dni".to_s, count: 2
    assert_select "tr>td", text: "Full Name".to_s, count: 2
    assert_select "tr>td", text: "Telephone".to_s, count: 2
    assert_select "tr>td", text: "Birthday".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
  end
end
