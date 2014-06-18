class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :actor, null: false
      t.string :description
      t.integer :television_show_id
    end
    add_index :characters, :name, unique: true
  end
end
