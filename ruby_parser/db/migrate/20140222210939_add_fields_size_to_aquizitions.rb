class AddFieldsSizeToAquizitions < ActiveRecord::Migration
  def change
    add_column :aquizitions, :fields_size, :integer
  end
end
