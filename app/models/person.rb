class Person < ApplicationRecord
  belongs_to :organization
  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, nil]
  end

end
