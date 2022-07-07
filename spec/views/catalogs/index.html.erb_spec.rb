# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'catalogs/index', type: :view do
  before(:each) do
    assign(:catalogs, [
             Catalog.create!(
               reference: 'Reference',
               name: 'Name',
               description: 'Description',
               price: 2,
               actived: false
             ),
             Catalog.create!(
               reference: 'Reference',
               name: 'Name',
               description: 'Description',
               price: 2,
               actived: false
             )
           ])
  end

  it 'renders a list of catalogs' do
    render
    assert_select 'tr>td', text: 'Reference'.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
