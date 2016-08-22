class Release < ActiveRecord::Base

  validates :app_id, presence: true
  belongs_to :app
  validates :tag_name, presence: true
  has_many :release_clients, dependent: :destroy
  has_many :clients, through: :release_clients

  scope :released, -> { where("release_date is not null") }
  scope :pending, -> { where(release_date: nil) }

  def self.for_app(app)
    where(app: app)
  end

  def formatted_release_date
    release_date.strftime("%B %d, %Y, %H:%M")
  end

  def released?
    !release_date.blank?
  end

end
