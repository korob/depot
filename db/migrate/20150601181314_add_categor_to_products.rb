class AddCategorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :categor, :string
  end
end
