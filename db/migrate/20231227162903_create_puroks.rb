class CreatePuroks < ActiveRecord::Migration[6.1]
  def change
    create_table :puroks do |t|
      t.string   :name
      t.string   :current_kagawad
      t.integer  :num

      t.timestamps
    end
  end
end
