class Admin::ConditionsController < ApplicationController
  before_action :authenticate_admin!
  def show
    @condition = Condition.find(params[:id])
  end
end
