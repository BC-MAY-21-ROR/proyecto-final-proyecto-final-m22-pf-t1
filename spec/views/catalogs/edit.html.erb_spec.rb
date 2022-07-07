# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'catalogs/edit', type: :view do
  before(:each) do
    @catalog = assign(:catalog, Catalog.create!(
                                  reference: 'MyString',
                                  name: 'MyString',
                                  description: 'MyString',
                                  price: 1,
                                  actived: false
                                ))
  end

  it 'renders the edit catalog form' do
    render

    assert_select 'form[action=?][method=?]', catalog_path(@catalog), 'post' do
      assert_select 'input[name=?]', 'catalog[reference]'

      assert_select 'input[name=?]', 'catalog[name]'

      assert_select 'input[name=?]', 'catalog[description]'

      assert_select 'input[name=?]', 'catalog[price]'

      assert_select 'input[name=?]', 'catalog[actived]'
    end
  end
end
