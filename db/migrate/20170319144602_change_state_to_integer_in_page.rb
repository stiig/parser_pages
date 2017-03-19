class ChangeStateToIntegerInPage < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        remove_column :pages, :state
        add_column :pages, :state, :integer, default: 0, null: false
      end

      dir.down do
        remove_column :pages, :state
        add_column :pages, :state, :boolean, default: false, null: false
      end
    end
  end
end
