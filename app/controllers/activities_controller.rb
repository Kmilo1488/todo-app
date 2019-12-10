# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.create(activity_params)
    if @activity.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:name, :workdays, :employee_id)
  end
end
