class ReleaseClient < ActiveRecord::Base

  belongs_to :client
  belongs_to :release
  validates :client_id, presence: true
  validates :release_id, presence: true

end
