Ransack.configure do |config|
  config.add_predicate 'to_age_lteq',
    arel_predicate: 'gteq',
    formatter: -> (q) { ((q + 1).years.ago + 1.day).to_date },
    type: :integer,
    compounds: false
  config.add_predicate 'to_age_gteq',
    arel_predicate: 'lteq',
    formatter: -> (q) { q.years.ago.to_date },
    type: :integer,
    compounds: false
end