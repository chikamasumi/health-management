class Admin::InquiriesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @inquiries = inquiry.all.order(created_at: :desc)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end
end
