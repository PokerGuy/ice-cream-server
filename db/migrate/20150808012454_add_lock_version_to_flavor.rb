class AddLockVersionToFlavor < ActiveRecord::Migration
  def change
    add_column :flavors, :lock_version, :string
  end
end
