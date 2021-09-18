class Public::InquiriesController < ApplicationController
  before_action :authenticate_user!
  def new
    @inquiry = Inquiry.new
    @inquiry.user_id = current_user.id
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user_id = current_user.id
    @inquiry.save
    redirect_to compleate_inquiries_path
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    #@inquiry.user_id = current_user.id
  end

  

  def index
    @inquiry = current_user.inquiries.order(created_at: :desc)
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:title, :body)
  end
end
