class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :topic
      t.string :tokenlist
      t.string :photo
      t.string :description
      t.string :tokenadminrails
      t.string :generate
      t.string :model
      t.string :GroupList
      t.string :topic
      t.string :tokenuser

      t.timestamps null: false
    end
  end
end
