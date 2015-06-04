# -*- encoding : utf-8 -*-
class CombineItemsInCart < ActiveRecord::Migration
  def change
  end

  def up
  	Cart.all.each do |cart|
  		sums = cart.line_items.group(:product_id).sum(:quantily)

  		sums.each do |product_id, quantily|
  			if quantily > 1
  				cart.line_items.where(product_id: product_id).delete_all

  				item = cart.line_items.build(product_id: product_id)
  				item.quantily = quantily
  				item.save!
  			end
  		end
  	end
  end

  def down
  	LineItem.where("quantily>1").each do |line_item|
  		LineItem.quantily.times do
  			LineItem.create cart_id: line_item.cart_id,
  				product_id: line_item.product_id, quantily: 1
  		end
  		line_item.destroy
  	end
  end

end
