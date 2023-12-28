class CreateResidents < ActiveRecord::Migration[6.1]
  def change
    create_table :residents do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :middle_name
      t.string   :birthdate
      t.string   :contact_no
      t.references :purok, index: true, foreign_key: true

      t.timestamps
    end
  end
end
