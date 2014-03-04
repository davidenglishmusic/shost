class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :pieces, :positionInCycle, :positionincycle
  end
end
