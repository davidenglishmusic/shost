class SwitchPageColumnToIntegerForSongnotes < ActiveRecord::Migration

  def self.up  
    if connection.adapter_name.downcase == 'postgresql'
      connection.execute(%q{
        alter table songnotes
        alter column page
        type integer using page::integer
      })
    else
      change_column :songnotes, :page, :integer
    end
  end


  def self.down
	 change_column :songnotes, :page, :string
  end

end
