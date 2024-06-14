class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.text :steps
      t.references :chef, null: false, foreign_key: true

      t.timestamps
    end
  end
end
