# frozen_string_literal: true

# == Schema Information
#
# Table name: activities
#
#  id           :bigint           not null, primary key
#  completed_at :datetime
#  name         :string           not null
#  status       :integer          default(0), not null
#  workdays     :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  employee_id  :bigint
#
# Indexes
#
#  index_activities_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  def setup
    @activity = activities(:one)
  end

  test 'should valid fixture' do
    assert_must validate_presence_of(:name), @activity
  end

  test 'should belong to employee' do
    assert_must belong_to(:employee).optional, @activity
  end

  test 'should set completed_at after update' do
    @activity.working!
    assert_not_nil @activity.completed_at
  end
end
