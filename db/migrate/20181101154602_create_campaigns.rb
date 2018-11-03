class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.string :goald
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
