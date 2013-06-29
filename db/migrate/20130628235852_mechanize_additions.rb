class MechanizeAdditions < ActiveRecord::Migration
  def change
    add_column :answers, :product_name, :string
    add_column :answers, :picture_url, :string
  end
end
