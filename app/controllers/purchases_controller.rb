class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_item, only: [:index, :create]


  def index
    @purchase_address = PurchaseAddress.new

    if user_signed_in?
      if current_user == @item.user || @item.purchase.present?
        redirect_to root_path
      end
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    @purchase_address.item_id = @item.id

    if @purchase_address.valid?
        pay_item
        @purchase_address.save
        redirect_to root_path
    else
      errors = @purchase_address.errors.full_messages
      render :index
    end

  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :shipping_area_id, :cities, :number, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

end

