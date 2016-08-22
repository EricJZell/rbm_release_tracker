class App < ActiveRecord::Base

  validates :name, presence: true
  has_many :releases, -> { order(release_date: :desc) }, dependent: :destroy
  has_many :clients

end
