class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :description
      t.string :sectionHeading
      t.text :blockquote
      t.text :imgFluid
      t.string :font

      t.timestamps
    end
  end
end
