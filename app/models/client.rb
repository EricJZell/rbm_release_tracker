class Client < ActiveRecord::Base

  validates :name, presence: true
  validates :app_id, presence: true
  belongs_to :app

end
