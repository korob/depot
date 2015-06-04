# -*- encoding : utf-8 -*-
class ZaprollsController < ApplicationController
  skip_before_action :authorize
	include CurrentCart
	before_action :set_cart 
  def index
  	@products = Product.where("categor = 'Zap roll'")
  end
end
