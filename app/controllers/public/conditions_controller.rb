class Public::ConditionsController < ApplicationController
  before_action :authenticate_user!
  def new
    @condition = Condition.new
  end

  def index
    @condition = current_user.conditions.order(created_at: :desc)
  end

  def edit
    @condition = Condition.find(params[:id])
  end


  def create
    @condition = Condition.new(condition_params)
    @condition.user_id = current_user.id
    if @condition.save
      redirect_to conditions_path
    else
      render :new
    end
  end

  def update
    @condition = Condition.find(params[:id])
    @condition.update(condition_params)
    redirect_to conditions_path
  end

  private
  def condition_params
    params.require(:condition).permit(:temperature, :condition, :remark)
  end
end
