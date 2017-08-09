class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :price
      t.string :title
      t.text :images
      t.text :features
      t.integer :number_of_reviews
      t.string :best_seller_rank
      t.string :inventory

      t.timestamps
    end
  end
end
