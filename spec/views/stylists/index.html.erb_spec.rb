# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stylists/index', type: :view do
  before(:each) do
    assign(:stylists, [
             Stylist.create!(
               dni: 'Dni',
               name: 'Name',
               actived: false,
               role: 'Role'
             ),
             Stylist.create!(
               dni: 'Dni',
               name: 'Name',
               actived: false,
               role: 'Role'
             )
           ])
  end

  it 'renders a list of stylists' do
    render
    assert_select 'tr>td', text: 'Dni'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
    assert_select 'tr>td', text: 'Role'.to_s, count: 2
  end
end
