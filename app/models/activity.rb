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
  belongs_to :employee, optional: true

  scope :started, -> { where(status: :pending) }
  scope :workings, -> { where(status: :working) }
  scope :finish, -> { where(status: :completed) }

  validates :name, presence: true

  enum status: { pending: 0, working: 1, completed: 2 }

  after_commit :set_completed_at, on: :update

  def days_late
    return unless completed_at?

    (Time.current - completed_at).to_i / 1.day if Time.current > completed_at
  end

  def set_completed_at
    return if completed_at?

    if workdays.presence
      update(completed_at: created_at.advance(days: workdays))
    end
  end
end
