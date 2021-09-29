class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :messages, foreign_key: true
      t.references :users, foreign_key: true

      t.text :content

      t.timestamps
    end
  end
end
