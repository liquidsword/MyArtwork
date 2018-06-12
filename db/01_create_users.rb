class CreateUsers < ActiveRecord::Migration[5.0]
    def change
        create_table :users do |a|
            a.string :username
            a.string :email
            a.string :password
            end
        end
    end
