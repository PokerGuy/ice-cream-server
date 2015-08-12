class ChangeLockValueOnFlavor < ActiveRecord::Migration
  def change
    remove_column :flavors, :lock_version
    add_column :flavors, :lock_version, :integer, :default => 0
  end
end
