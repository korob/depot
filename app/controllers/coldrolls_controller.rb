# -*- encoding : utf-8 -*-
class ColdrollsController < ApplicationController
  skip_before_action :authorize
	include CurrentCart
	before_action :set_cart 
  def index
  	@products = Product.where("categor = 'Cold roll'")
  end
end
