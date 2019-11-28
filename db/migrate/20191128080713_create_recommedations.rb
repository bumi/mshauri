class CreateRecommedations < ActiveRecord::Migration[6.0]
  def change
    create_table :recommedations do |t|
      t.references :answer, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
