json.sounds @sounds do |sound|
  json.id sound.id
  json.name sound.name
  json.audio sound.file.url.split('?').first.gsub('http:', 'https:')
  json.image sound.card.url.split('?').first.gsub('http:', 'https:')
  json.translation sound.translation
end
