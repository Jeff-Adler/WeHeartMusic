class CreateConnections < ActiveRecord::Migration[6.0]
    def change
        create_table :connections do |t|
            t.integer :connector_id, foreign_key: { to_table: 'users' }
            t.integer :connectee_id, foreign_key: { to_table: 'users' }
            t.float :strength
        end
    end
end