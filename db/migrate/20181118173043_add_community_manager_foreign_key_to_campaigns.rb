class AddCommunityManagerForeignKeyToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :campaigns, :users, column: :community_manager_id
  end
end
