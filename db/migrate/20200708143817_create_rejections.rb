class CreateRejections < ActiveRecord::Migration[6.0]
  def change
    create_table :rejections do |t|
      t.integer :rejector_id, foreign_key: { to_table: 'users' }
      t.integer :rejectee_id, foreign_key: { to_table: 'users' }
      t.float :strength
    end
  end
end
