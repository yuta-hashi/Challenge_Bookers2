class AddIntroducutionIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introducution_id, :text
  end
end
