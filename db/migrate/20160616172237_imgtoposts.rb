class Imgtoposts < ActiveRecord::Migration
  def change
    add_column :posts, :img, :text
  end
end
