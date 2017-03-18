class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :url
      t.boolean :state, null: false, default: false

      t.timestamps
    end
  end
end
