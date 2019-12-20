# frozen_string_literal: true

Dir['./data/recommendations/*.yml'].each do |filename|
  identifier = File.basename(filename, '.yml')
  puts "Creating recommendation #{identifier}"
  recommendation_data = YAML.safe_load(File.read(filename))
  next if recommendation_data.nil?

  recommendation = Recommendation.where(identifier: identifier).first_or_initialize
  recommendation.title = recommendation_data['title']
  recommendation.intro = recommendation_data['intro']
  recommendation.description = recommendation_data['description']
  recommendation.priority = recommendation_data['priority'] || 0
  recommendation.general = recommendation_data['general']
  recommendation.save!
end
