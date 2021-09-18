class Admin::InquiriesController < ApplicationController
  before_action :authenticate_admin!
  def index
    @inquiries = Inquiry.all.order(created_at: :desc)
  end

  def search
    @inquiries = Inquiry.search(params[:keyword])
    @keyword = params[:keyword]
    render "index"
  end

  def show
    @inquiry = Inquiry.find(params[:id])
  end
end
