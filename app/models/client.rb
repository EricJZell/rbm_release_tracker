class Client < ActiveRecord::Base

  validates :name, presence: true
  validates :app_id, presence: true
  belongs_to :app
  has_many :release_clients, dependent: :destroy
  has_many :releases, through: :release_clients

  def current_release
    releases.order(created_at: :desc).first
  end

end
