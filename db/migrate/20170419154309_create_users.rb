class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :token
      t.string :name
      t.string :nick
      t.integer :tlf
      t.string :email
      t.string :photo
      t.string :status
      t.string :lastconexion
      t.string :privacity

      t.timestamps null: false
    end
  end
end
