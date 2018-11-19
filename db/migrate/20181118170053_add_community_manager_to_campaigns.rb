class AddCommunityManagerToCampaigns < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :community_manager_id, :integer
    add_index :campaigns, :community_manager_id
  end
end
