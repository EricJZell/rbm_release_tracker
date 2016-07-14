class App < ActiveRecord::Base

  validates :name, presence: true
  has_many :releases, dependent: :destroy
  has_many :clients

end
