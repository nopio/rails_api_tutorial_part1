class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :author, foreign_key: true, null: false
      t.string :title, index: true, null: false

      t.timestamps
    end
  end
end
