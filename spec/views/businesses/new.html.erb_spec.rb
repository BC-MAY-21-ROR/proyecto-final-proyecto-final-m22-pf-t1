# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'businesses/new', type: :view do
  before(:each) do
    assign(:business, Business.new(
                        name: 'MyString',
                        nit: 'MyString',
                        owner: 'MyString',
                        country: 'MyString',
                        city: 'MyString',
                        telephone: 'MyString',
                        email: 'MyString'
                      ))
  end

  it 'renders new business form' do
    render

    assert_select 'form[action=?][method=?]', businesses_path, 'post' do
      assert_select 'input[name=?]', 'business[name]'

      assert_select 'input[name=?]', 'business[nit]'

      assert_select 'input[name=?]', 'business[owner]'

      assert_select 'input[name=?]', 'business[country]'

      assert_select 'input[name=?]', 'business[city]'

      assert_select 'input[name=?]', 'business[telephone]'

      assert_select 'input[name=?]', 'business[email]'
    end
  end
end
