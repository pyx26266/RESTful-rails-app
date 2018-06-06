class CreateRestKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :rest_keys do |t|
      t.string :key
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
