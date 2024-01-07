# frozen_string_literal: true

# Add lobby_id foreign key to player table.
Sequel.migration do
  change do
    alter_table(:players) do
      add_foreign_key :lobby_id, :lobbies
    end
  end
end
