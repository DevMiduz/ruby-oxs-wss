# frozen_string_literal: true

require 'sequel'

# Player class inheriting for Sequel::Model
# represents a row in the players table.
class Player < Sequel::Model
  def validate
    super

    validates_presence(:key, :username, :platform, :status, :last_activity_at)

    # A manual check will have to be done to see whether username + platform is unique.
    validates_unique(:key, %i[username platform])
    validates_max_length 128, :key
    validates_max_length 196, :username
    validates_max_length 128, :platform
    validates_max_length 128, :status
  end
end
