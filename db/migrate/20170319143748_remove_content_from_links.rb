class RemoveContentFromLinks < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        remove_column :links, :content
      end

      dir.down do
        add_column :links, :content, :string
      end
    end
  end
end
