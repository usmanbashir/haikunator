require "haikunator/version"
require "securerandom"

module Haikunator
  class << self
    def haikunate(token_range = 9999, delimiter = "-", excluded_nouns: [], excluded_adjectives: [])
      build(token_range, delimiter, excluded_nouns: excluded_nouns, excluded_adjectives: excluded_adjectives)
    end

    private

    def build(token_range, delimiter, excluded_nouns: [], excluded_adjectives: [])
      filtered_adjectives = excluded_adjectives.present? ? adjectives.filter {|a| !excluded_adjectives.include?(a) } : adjectives
      filtered_nouns = excluded_nouns.present? ? nouns.filter {|n| !excluded_nouns.include?(n) } : nouns
      sections = [
        filtered_adjectives[random_seed % filtered_adjectives.length],
        filtered_nouns[random_seed % filtered_nouns.length],
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
        icy delicate quiet cool spring winter patient
        twilight dawn crimson wispy weathered blue billowing
        broken cold damp falling frosty green long late lingering
        bold little morning muddy old red rough still small
        sparkling thrumming shy wandering withered wild mature
        young holy solitary fragrant aged snowy proud floral
        restless divine polished ancient purple lively nameless
        dazzling brave happy enchanting gentle glorious handsome
        marvelous classy calming beautiful amazing urban incredible
        heavenly bright brilliant salty mystic adorable elegant
        astonishing graceful charming gleaming fascinating delightful
        clever captivating fierce fashionable exquisite breathtaking
        exuberant serene majestic radiant melodic harmonious
        captivating jubilant blissful zesty
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
        wave water resonance sun log dream cherry tree fog
        frost voice paper frog smoke star
        koala vegemite acai jungle beach desert chocolate deer
        tiramisu island honey smoothie valley ocean earth
        plains camel coffee tea cookies soup dandelion sprinkles
        snail lullaby platypus painting wallaby flamingo owl
        otter fox pancake biscuit
      )
    end
  end
end
