class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to @item, notice: "商品が作成されました。"
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :catch_copy, :image, :category_id, :situation_id, :load_id, :shipping_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
  end
  
end
