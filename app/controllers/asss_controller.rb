class AsssController < ApplicationController
  skip_before_action :authorize
	include CurrentCart
	before_action :set_cart 
  def index
  	@products = Product.where("categor = 'Ass'")
  end
end
