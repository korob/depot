# -*- encoding : utf-8 -*-
class AddQuantilyToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :quantily, :integer, default: 1
  end
end
