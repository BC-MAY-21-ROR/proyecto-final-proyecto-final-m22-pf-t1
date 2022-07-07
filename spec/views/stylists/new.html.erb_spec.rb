# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stylists/new', type: :view do
  before(:each) do
    assign(:stylist, Stylist.new(
                       dni: 'MyString',
                       name: 'MyString',
                       actived: false,
                       role: 'MyString'
                     ))
  end

  it 'renders new stylist form' do
    render

    assert_select 'form[action=?][method=?]', stylists_path, 'post' do
      assert_select 'input[name=?]', 'stylist[dni]'

      assert_select 'input[name=?]', 'stylist[name]'

      assert_select 'input[name=?]', 'stylist[actived]'

      assert_select 'input[name=?]', 'stylist[role]'
    end
  end
end
