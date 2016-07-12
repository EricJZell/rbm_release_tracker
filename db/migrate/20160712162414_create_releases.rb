class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.integer :app_id, null: false
      t.text :description
      t.string :branch_name
      t.string :tag_name

      t.timestamps null: false
    end
  end
end
