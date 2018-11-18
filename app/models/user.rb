# frozen_string_literal: true

class User < ApplicationRecord
  has_many :campaigns, foreign_key: 'community_manager_id'

  enum role: %i[community_manager content_generator designer]

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true
  validate :validate_username
  validates :username, presence: true, uniqueness: true
  attr_writer :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, authentication_keys: [:login]

  # TODO: make this methods private a ver que chingados pasa
  def login
    @login || username
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(['lower(username) = :value', { value: login.downcase }]).first
    elsif conditions.key?(:username)
      where(conditions.to_hash).first
    end
  end

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end
end
