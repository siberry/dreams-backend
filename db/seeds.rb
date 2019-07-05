require 'rest-client'
require 'json'
# require 'byebug'

heroku_tags = DreamTag.get_JSON_response("https://majestic-canyonlands-27127.herokuapp.com/dream_tags")

heroku_tag_names = heroku_tags.map {|dream_tag|
  dream_tag["tag_name"]
}

DreamTag.get_JSON_response("http://localhost:3000/dream_tags").each {|dream_tag|
  if !heroku_tag_names.include?(dream_tag["tag_name"])
    DreamTag.post_to_heroku_db(dream_tag)
  end
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
