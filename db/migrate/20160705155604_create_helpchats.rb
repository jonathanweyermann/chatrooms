class CreateHelpchats < ActiveRecord::Migration[5.0]
  def change
    create_table :helpchats do |t|
      t.string :name
      t.integer :state
      t.references :customer, foreign_key: true
      t.references :operator, foreign_key: true

      t.timestamps
    end
  end
end
