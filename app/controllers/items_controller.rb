class ItemsController < ApplicationController
  def index
    @items = Item.borrowed.order_by(created_at: :desc).all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(permitted_params[:item])
    if @item.save
      redirect_to items_path, notice: 'Successfully borrowed item!'
    else
      render 'new'
    end
  end

  def return
    check_admin
    @item = Item.find(params[:id])

    if @item.update(returned_at: Time.now)
      redirect_to items_path, notice: 'Item successfully returned!'
    else
      redirect_to items_path, notice: 'There was an error while returning the item!'
    end
  end

  def notify
    check_admin
    @item = Item.find(params[:id])

    NotificationMailer.notification_email(@item).deliver_later!

    if @item.update(last_notification_at: Time.now)
      redirect_to items_path, notice: 'Successfully sent notification email!'
    else
      redirect_to items_path, notice: 'There was an error while sendinf the notification email!'
    end
  end

  def archive
    check_admin
    @items = Item.returned.order_by(created_at: :desc).all
  end

  protected

  def permitted_params
    params.permit(item: [:description, :borrower_email])
  end
end
