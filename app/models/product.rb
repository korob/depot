# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base

	PRODUCT_TYPE = [ "Hot roll", "Zap roll", "Firm roll", 
		"Clas roll", "Ass", "Dop k roll",
		"Sushi", "Cold roll", "Salat", "Excl", "Nap", "Desert" ]




	has_many :line_items
	has_many :order, through: :line_items

	validates :title, :description, :image_url, :categor, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'URL должен указывать на картинки'
	}

	def self.latest
		Product.order(:update_at).last
	end

	private

	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'существуют товарные позиции')
			return false
		end
	end

end
