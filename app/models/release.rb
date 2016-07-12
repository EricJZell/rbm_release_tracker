class Release < ActiveRecord::Base

  validates :app_id, presence: true
  belongs_to :app
  validates :branch_name, presence: true
  validates :tag_name, presence: true

end
