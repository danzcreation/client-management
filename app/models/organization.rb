class Organization < ApplicationRecord
  belongs_to :account_manager, class_name: 'User', optional: true
  has_many :people, dependent: :delete_all
  has_one_attached :logo

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
