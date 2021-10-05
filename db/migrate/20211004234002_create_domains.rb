class CreateDomains < ActiveRecord::Migration[6.1]
  def change
    create_table :domains do |t|
      t.string :title
      t.references :college, null: false, foreign_key: true

      t.timestamps
    end
  end
end
