class Comments < ActiveRecord::Migration[5.2]
  def change
    drop_table :Comments
  end
end
