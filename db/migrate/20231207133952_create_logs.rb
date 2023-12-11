class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.string :number
      t.string :action

      t.timestamps
    end
  end
end
