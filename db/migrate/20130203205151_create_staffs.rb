class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :username
      t.string :password
      t.timestamps
    end
  end
end
