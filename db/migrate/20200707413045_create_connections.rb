class CreateConnections < ActiveRecord::Migration[6.0]
    def change
        create_table :connections do |t|
            t.integer :user_1_id, foreign_key: { to_table: 'users' }
            t.integer :user_2_id, foreign_key: { to_table: 'users' }
            t.float :strength
        end
    end
end