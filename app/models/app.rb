class App < ActiveRecord::Base

  validates :name, presence: true
  has_many :releases, -> { order(created_at: :desc) }, dependent: :destroy
  has_many :clients

end
