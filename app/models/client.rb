class Client < ActiveRecord::Base

  validates :name, presence: true
  validates :app_id, presence: true
  belongs_to :app
  has_many :release_clients, dependent: :destroy
  has_many :releases, -> { order(release_date: :desc) }, through: :release_clients

  def current_release
    releases.released.first
  end

end
