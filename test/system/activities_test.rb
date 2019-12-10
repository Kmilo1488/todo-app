# frozen_string_literal: true

require 'application_system_test_case'

class ActivitiesTest < ApplicationSystemTestCase
  test 'should view button new activity' do
    visit root_path
    assert_link 'New activity'
  end

  test 'should create new activity' do
    visit root_path
    click_on 'New activity'

    fill_in('activity[name]', with: 'Bañar perro')
    fill_in('activity[workdays]', with: 10)
    select 'Ally Kathe', from: 'activity[employee_id]'

    click_on 'Create activity'
  end

  test 'should assign employee for activity' do
    @activity = activities(:two)
    visit edit_activity_path(@activity)

    select 'Alan Brito', from: 'activity[employee_id]'
    click_on 'Update activity'

    assert_link'New activity'
    assert_link'New employee'
  end
end
