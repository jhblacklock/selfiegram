class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :url
      t.string :caption
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
