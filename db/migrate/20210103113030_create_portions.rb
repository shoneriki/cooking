class CreatePortions < ActiveRecord::Migration[6.0]
  def change
    create_table :portions do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
