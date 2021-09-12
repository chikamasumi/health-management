class Public::ConditionsController < ApplicationController
  def new
    @conditon = Condition.new
  end

  def create
  end
end
