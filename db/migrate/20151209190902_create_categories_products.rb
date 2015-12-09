class CreateCategoriesProducts < ActiveRecord::Migration
  def change
    create_table :categories_products do |t|

      t.timestamps null: false
    end
  end
end
