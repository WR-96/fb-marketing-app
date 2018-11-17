# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :contacts
  has_many :campaigns
end
