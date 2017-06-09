class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :tokenuser
      t.string :tokencontact
      t.string :lastsync

      t.timestamps null: false
    end
  end
end
