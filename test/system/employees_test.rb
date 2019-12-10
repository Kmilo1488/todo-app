# frozen_string_literal: true

require 'application_system_test_case'

class EmployeesTest < ApplicationSystemTestCase
  test 'should view button new employee' do
    visit root_path
    assert_link 'New employee'
  end

  test 'should create new employee' do
    visit root_path
    click_on 'New employee'

    fill_in('employee[name]', with: 'Pepito Perez')

    click_on 'Create employee'

    assert_link'New activity'
    assert_link'New employee'
  end
end
