class AddReleaseDateToReleases < ActiveRecord::Migration
  def change
    add_column :releases, :release_date, :datetime
  end
end
