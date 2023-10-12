class CreateOrganizations < ActiveRecord::Migration[7.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :website
      t.references :account_manager, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
