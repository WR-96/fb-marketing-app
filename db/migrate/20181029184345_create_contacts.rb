class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :phone_number
      t.integer :cell_number
      t.string :email
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
