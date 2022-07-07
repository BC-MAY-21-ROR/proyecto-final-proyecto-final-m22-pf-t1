# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'businesses/show', type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
                                    name: 'Name',
                                    nit: 'Nit',
                                    owner: 'Owner',
                                    country: 'Country',
                                    city: 'City',
                                    telephone: 'Telephone',
                                    email: 'Email'
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Nit/)
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Telephone/)
    expect(rendered).to match(/Email/)
  end
end
