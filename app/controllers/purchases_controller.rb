class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:create, ]


  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    @purchase_address.item_id = @item.id
    
    if @purchase_address.valid?
       @purchase_address.save
       redirect_to root_path
    else
      errors = @purchase_address.errors.full_messages
      render :index
    end

  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :shipping_area_id, :cities, :number, :phone_number).merge(user_id: current_user.id)
  end

end

