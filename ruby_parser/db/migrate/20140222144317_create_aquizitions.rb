class CreateAquizitions < ActiveRecord::Migration
  def change
    alter_table :aquizitions do |t|
      t.add_column :file_lines, :text
      t.add_column :winner
      t.add_column :winner_cui
      t.add_column :winner_country
      t.add_column :winner_city
      t.add_column :procurement_type
      t.add_column :contract_authority
      t.add_column :contract_authority_cui
      t.add_column :notice_number
    end
  end
end
