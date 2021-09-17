class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @conditions = Condition.all.order(created_at: :desc)
  end
end
