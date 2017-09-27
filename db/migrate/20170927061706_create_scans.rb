class CreateScans < ActiveRecord::Migration[5.0]
  def change
    create_table :scans do |t|
      t.string :scan_eventid
      t.string :user_openid
      t.string :user_id
      t.string :catagory
      t.string :parent_id
      t.datetime :scan_at
      t.datetime :comfirmed_at
      t.timestamps
    end

    add_index :scans, :scan_eventid
  end
end
