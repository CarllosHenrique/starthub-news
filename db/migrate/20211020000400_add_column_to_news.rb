class AddColumnToNews < ActiveRecord::Migration[6.1]
  def change
    add_column :news, :fontLink, :string
  end
end
