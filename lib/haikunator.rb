require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(*args)
      seed = random_seed

      token_range = args[0] || 9999
      delimiter = args[1] || "-"
      adjective_array = args[2] || adjectives

      build(seed, token_range, delimiter, adjective_array)
    end

    private

    def build(seed, token_range, delimiter, adjective_array)
      sections = [
        adjective_array[seed % adjective_array.length],
        nouns[seed % nouns.length],
        token(token_range)
      ]

      sections.compact.join(delimiter)
    end

    def random_seed
      SecureRandom.random_number(4096)
    end

    def token(range)
      SecureRandom.random_number(range) if range > 0
    end

    def adjectives
      %w(
        autumn hidden bitter misty silent empty dry dark summer
        icy delicate quiet white cool spring winter patient
        twilight dawn crimson wispy weathered blue billowing
        broken cold damp falling frosty green long late lingering
        bold little morning muddy old red rough still small
        sparkling throbbing shy wandering withered wild black
        young holy solitary fragrant aged snowy proud floral
        restless divine polished ancient purple lively nameless
      )
    end

    def nouns
      %w(
        waterfall river breeze moon rain wind sea morning
        snow lake sunset pine shadow leaf dawn glitter forest
        hill cloud meadow sun glade bird brook butterfly
        bush dew dust field fire flower firefly feather grass
        haze mountain night pond darkness snowflake silence
        sound sky shape surf thunder violet water wildflower
        wave water resonance sun wood dream cherry tree fog
        frost voice paper frog smoke star
      )
    end
  end
end
