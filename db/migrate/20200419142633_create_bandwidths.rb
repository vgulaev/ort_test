class CreateBandwidths < ActiveRecord::Migration[6.0]
  def change
    create_table :bandwidths do |t|
      t.references :server, null: false, foreign_key: true
      t.float :value
      t.string :interface_name
      t.timestamps
    end

    add_index :bandwidths, [:server_id, :interface_name], :unique => true
  end
end
