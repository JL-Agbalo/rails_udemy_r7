class Role < ApplicationRecord
  has_many :admins  
  validates :name, presence: true, uniqness: true

end
