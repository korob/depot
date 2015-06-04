# -*- encoding : utf-8 -*-
class AddOrderToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :order, index: true
  end
end
