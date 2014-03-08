class SwitchPageColumnToIntegerForSongnotes < ActiveRecord::Migration
  def change
    change_column :songnotes, :page, :integer
  end
end
