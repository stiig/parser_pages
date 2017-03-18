class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.references :page, foreign_key: true, null: false
      t.string :url
      t.string :content

      t.timestamps
    end
  end
end
