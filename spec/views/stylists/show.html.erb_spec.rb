# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stylists/show', type: :view do
  before(:each) do
    @stylist = assign(:stylist, Stylist.create!(
                                  dni: 'Dni',
                                  name: 'Name',
                                  actived: false,
                                  role: 'Role'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Dni/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Role/)
  end
end
