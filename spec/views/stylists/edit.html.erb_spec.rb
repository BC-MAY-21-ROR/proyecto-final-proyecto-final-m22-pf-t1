# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stylists/edit', type: :view do
  before(:each) do
    @stylist = assign(:stylist, Stylist.create!(
                                  dni: 'MyString',
                                  name: 'MyString',
                                  actived: false,
                                  role: 'MyString'
                                ))
  end

  it 'renders the edit stylist form' do
    render

    assert_select 'form[action=?][method=?]', stylist_path(@stylist), 'post' do
      assert_select 'input[name=?]', 'stylist[dni]'

      assert_select 'input[name=?]', 'stylist[name]'

      assert_select 'input[name=?]', 'stylist[actived]'

      assert_select 'input[name=?]', 'stylist[role]'
    end
  end
end
