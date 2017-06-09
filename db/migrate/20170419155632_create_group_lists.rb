class CreateGroupLists < ActiveRecord::Migration
  def change
    create_table :group_lists do |t|
      t.string :topic
      t.string :tokenuser

      t.timestamps null: false
    end
  end
end
