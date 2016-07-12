class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name, null: false
    end
  end
end
