class SwitchPageColumnToIntegerForSongnotes < ActiveRecord::Migration
  def self.up
    change_column :songnotes, :page, 'integer USING CAST(column_name AS integer)'
  end

  def self.down
    change_column :songnotes, :page, :string
  end
end
