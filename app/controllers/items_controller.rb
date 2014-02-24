class ItemsController < ApplicationController
  def index
    if params[:show_inactive] == "true"
      @items = Item.all
    else
      @items = Item.active
    end
  end

end
