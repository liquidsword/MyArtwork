class CreateArtwork < ActiveRecord::Migration
    def change
        create_table :artwork do |a|
            a.string :art
            a.integer :user_id
            end
        end
    end
