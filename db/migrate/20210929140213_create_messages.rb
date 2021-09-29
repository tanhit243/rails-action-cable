class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :users, foreign_key: true

      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
