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

class Activity < ApplicationRecord
  belongs_to :employee

  enum status: { pending: 0, working: 1, completed: 2 }
end
