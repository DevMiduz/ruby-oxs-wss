# frozen_string_literal: true

# Create a players table with:
#    - id (primary_key)
#    - key (String 128)
#    - username (String 196)
#    - platform (String 128)
#    - status (String 128)
#    - last_activity_at (Integer) (epoch timestamp)
Sequel.migration do
  change do
    create_table(:players) do
      primary_key :id
      String :key, size: 128, null: false, unique: true
      String :username, size: 196, null: false, unique: true
      String :platform, size: 128, null: false
      String :status, size: 128, null: false
      Integer :last_activity_at, default: Sequel.function(:to_timestamp, Sequel.function(:now)), null: false
    end
  end
end
