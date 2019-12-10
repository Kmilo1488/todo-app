# frozen_string_literal: true

class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name)
  end
end
