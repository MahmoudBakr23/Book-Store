class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :year
      t.string :price
      t.string :buy
      t.text :excerpt
      t.string :format
      t.integer :pages
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true
      t.references :publisher, foreign_key: true

      t.timestamps
    end
  end
end
