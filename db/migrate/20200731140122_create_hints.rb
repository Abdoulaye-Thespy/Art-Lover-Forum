class CreateHints < ActiveRecord::Migration[6.0]
  def change
    create_table :hints do |t|
    t.string :text
    t.references :user, foreign_key: true
    t.timestamps
    end
  end
end
