class CreateHeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :headers do |t|
      t.references :page, foreign_key: true, null: false
      t.integer :header_type
      t.string :content

      t.timestamps
    end
  end
end
