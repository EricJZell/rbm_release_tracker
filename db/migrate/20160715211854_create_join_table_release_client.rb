class CreateJoinTableReleaseClient < ActiveRecord::Migration
  def change
    create_table :release_clients do |t|
      t.integer :release_id
      t.integer :client_id
    end
  end
end
