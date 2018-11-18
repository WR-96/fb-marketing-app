# frozen_string_literal: true

class Campaign < ApplicationRecord
  belongs_to :company
  belongs_to :community_manager, class_name: "User"
end
