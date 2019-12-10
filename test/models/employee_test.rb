# frozen_string_literal: true

# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  def setup
    @employee = employees(:one)
  end

  test 'should valid fixture' do
    assert_must validate_presence_of(:name), @employee
  end

  test 'should have many activities' do
    assert_must have_many(:activities), @employee
  end
end
