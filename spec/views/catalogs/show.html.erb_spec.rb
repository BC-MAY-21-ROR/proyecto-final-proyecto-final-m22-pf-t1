# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'catalogs/show', type: :view do
  before(:each) do
    @catalog = assign(:catalog, Catalog.create!(
                                  reference: 'Reference',
                                  name: 'Name',
                                  description: 'Description',
                                  price: 2,
                                  actived: false
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Reference/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
