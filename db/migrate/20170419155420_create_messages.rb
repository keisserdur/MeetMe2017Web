class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :tokenuser
      t.string :type
      t.string :content
      t.string :tokenuser
      t.string :tokencontact
      t.string :day
      t.string :time

      t.timestamps null: false
    end
  end
end
