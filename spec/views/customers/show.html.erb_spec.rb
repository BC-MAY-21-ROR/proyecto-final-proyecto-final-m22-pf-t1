require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      dni: "Dni",
      full_name: "Full Name",
      telephone: "Telephone",
      birthday: "Birthday",
      email: "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Dni/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Telephone/)
    expect(rendered).to match(/Birthday/)
    expect(rendered).to match(/Email/)
  end
end
