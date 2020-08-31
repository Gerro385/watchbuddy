class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :status, default: 0 # 0 is pending, 1 is accepted, and 2 is declined

      t.timestamps
    end
  end
end
