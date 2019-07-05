require 'rest-client'
require 'json'
require 'byebug'


DreamTag.get_JSON_response("http://localhost:3000/dream_tags").each {|dream_tag|
  DreamTag.post_to_heroku_db(dream_tag)
}

# alphabet = ('a'..'z').to_a
#
# alphabet.each { |letter|
#   DreamTag.createDreamTagsFromPage(letter)
# }

# dream
  # t.string "dream"
  # t.string "date"
  # t.integer "hours_slept"
  # t.string "quality"
  # t.string "state_of_mind"
  # t.string "image_url"
  # t.bigint "user_id"
