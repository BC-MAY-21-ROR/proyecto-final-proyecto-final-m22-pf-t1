require 'rails_helper'

RSpec.describe "customers/new", type: :view do
  before(:each) do
    assign(:customer, Customer.new(
      dni: "MyString",
      full_name: "MyString",
      telephone: "MyString",
      birthday: "MyString",
      email: "MyString"
    ))
  end

  it "renders new customer form" do
    render

    assert_select "form[action=?][method=?]", customers_path, "post" do

      assert_select "input[name=?]", "customer[dni]"

      assert_select "input[name=?]", "customer[full_name]"

      assert_select "input[name=?]", "customer[telephone]"

      assert_select "input[name=?]", "customer[birthday]"

      assert_select "input[name=?]", "customer[email]"
    end
  end
end
