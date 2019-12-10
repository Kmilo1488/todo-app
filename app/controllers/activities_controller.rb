# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :set_activity

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

  def edit; end

  def update
    if @activity.update(activity_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:name, :workdays, :employee_id, :status)
  end
end
