# frozen_string_literal: true

class ApplicationPresenter < SimpleDelegator
  def initialize; end

  def pending
    Activity.started
  end

  def working
    Activity.workings
  end

  def completed
    Activity.finish
  end
end
