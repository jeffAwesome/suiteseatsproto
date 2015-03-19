class PagesController < ApplicationController
  include HighVoltage::StaticPage
  before_filter :set_order
  before_filter :set_order_items

  layout :layout_for_page

  def set_order
    @order = Order.new
  end

  def set_order_items
    @order_item = OrderItem.new
  end


  private

  def layout_for_page
    case params[:id]
    when 'home'
      'home'
    else
      'application'
    end
  end
end
