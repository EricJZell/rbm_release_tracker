class Release < ActiveRecord::Base

  validates :app_id, presence: true
  belongs_to :app
  validates :tag_name, presence: true
  has_many :release_clients, dependent: :destroy
  has_many :clients, through: :release_clients

  def self.for_app(app)
    where(app: app)
  end

  def release_date
    created_at.strftime("%B %d, %Y, %H:%M")
  end

end
