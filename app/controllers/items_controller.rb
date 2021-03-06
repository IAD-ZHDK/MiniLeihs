class ItemsController < ApplicationController
  def index
    @items = Item.borrowed.order_by(created_at: :desc).all
  end

  def new
    return unless check_user('terminal', 'admin')
    @item = Item.new
  end

  def create
    return unless check_user('terminal', 'admin')
    @item = Item.new(permitted_params[:item])
    if @item.save
      redirect_to items_path, notice: 'Successfully borrowed item!'
    else
      render 'new'
    end
  end

  def return
    return unless check_user('admin')
    Item.find(params[:id]).update!(returned_at: Time.now)
    redirect_to items_path, notice: 'Item successfully returned!'
  end

  def request_return
    return unless check_user('admin')
    @item = Item.find(params[:id])
    RequestMailer.request_email(@item).deliver_later!
    @item.update!(last_return_request_at: Time.now)
    redirect_to items_path, notice: 'Request sent!'
  end

  def archive
    return unless check_user('admin')
    @items = Item.returned.order_by(returned_at: :desc).all
  end

  protected

  def permitted_params
    params.permit(item: [:description, :borrower_email, :agreed_to_terms])
  end
end
