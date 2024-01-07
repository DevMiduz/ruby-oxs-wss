# frozen_string_literal: true

# Create a lobbies table with:
#    - id (primary_key)
#    - key (String 128)
#    - lobby_data (Text)
#    - status (String 128)
#    - last_activity_at (Integer) (epoch timestamp)
Sequel.migration do
  change do
    create_table(:lobbies) do
      primary_key :id
      String :key, size: 128, null: false, unique: true
      Text :lobby_data
      String :status, size: 128, null: false
      Integer :last_activity_at, default: Sequel.function(:to_timestamp, Sequel.function(:now)), null: false
    end
  end
end
