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

class Employee < ApplicationRecord
  has_many :activities
end
