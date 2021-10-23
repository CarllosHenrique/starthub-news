class RemoveColumnFromNews < ActiveRecord::Migration[6.1]
  def change
    remove_column :news, :imgFluid, :text
  end
end
