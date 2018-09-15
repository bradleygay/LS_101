ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS = %w(fox dog head leg).freeze
VERBS = %w(jumps lifts bites licks).freeze
ADVERBS = %w(easily lazily noisily excitedly).freeze

File.open('madlib.txt') do |file|
  file.each do |line|
    puts format(line, adjective: ADJECTIVES.sample,
                   noun:      NOUNS.sample,
                   verb:      VERBS.sample,
                   adverb:    ADVERBS.sample)
  end
end
