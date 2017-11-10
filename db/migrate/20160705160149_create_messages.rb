class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :helpchat, foreign_key: true
      t.references :customer, foreign_key: true
      t.references :operator, foreign_key: true
      t.boolean :owner
      t.text :body

      t.timestamps
    end
  end
end
