class DreamTag < ApplicationRecord
  def self.get_JSON_response(url) #returns array of webcam objects
    response = RestClient.get(url,
      headers={
        "Content-Type": "application-json",
        "Accept": "application-json"
      }
    )
    parsed = JSON.parse(response)
    return parsed
  end

  def DreamTag.post_to_heroku_db(payload)
    RestClient.post(
      "https://majestic-canyonlands-27127.herokuapp.com/dream_tags",
      payload,
      headers={
        "Content-Type": "application-json",
        "Accept": "application-json"
      }
    )
  end

  #using Nokogiri for initial local db
  def self.createDreamTagsFromPage(letter)
    source = "https://cafeausoul.com/dreams/dreamdictionary"
    base_url = "https://cafeausoul.com/dreams/dreamdictionary?letter="
    html = open(base_url + letter)
    doc = Nokogiri::HTML(html)
    parsed = doc.css(".dictionary_results")
    parsed.each { |element|
      tag_name = element.css("h4").children.first.text.lstrip
      interpretation = element.css(".dictionary_results_content p").text
      DreamTag.create(tag_name: tag_name, interpretation: interpretation, source: source)
    }
  end

  def self.fixInterpretations
    self.all.each { |dream_tag|
      if dream_tag.interpretation.include?(" See ") || dream_tag.interpretation.include?(" Also see ")
        new_interpretation = dream_tag.interpretation.split(" See ").first
        new_interpretation = new_interpretation.split(" Also see ").first
        dream_tag.update(interpretation: new_interpretation)
      end
    }
  end

  def get_pixabay_JSON_response(url) # my API key expired
    response = RestClient.get(url)
    parsed = JSON.parse(response)
    parsed
  end

  def self.remove_pixabay_images
    self.all.select { |tag|
      if tag.img_url
        tag.img_url.include?("pixabay")
      end
    }.each { |tag| tag.update(img_url: "", change_image: true) }
  end

  def get_artsy_JSON_response(url)
    response = RestClient.get(url, headers={
      "X-Xapp-Token" => ArtsyXappToken.latest_artsy_token
      })
    parsed = JSON.parse(response)

    parsed
  end

  def self.get_image_urls_from_pixabay
    self.all.each { |tag|
      if !tag.img_url
        api_hits = tag.get_pixabay_JSON_response("https://pixabay.com/api/?key=12686864-f4feb2b35a07563443fffea22&q=#{tag.tag_name}")["hits"]
        if !api_hits.empty?
          img_url = api_hits.first["webformatURL"]
          tag.update(img_url: img_url)
        end
      end
    }
  end

  def get_image_url_from_artsy(offset=0)
    search_term = self.tag_name.split(" ").first
    search_term = search_term.length > 1 ? search_term : "letter+#{search_term}"
    resp = self.get_artsy_JSON_response("https://api.artsy.net/api/search?q=#{search_term}&offset=#{offset}")["_embedded"]["results"] # #{self.tag_name}
    if !resp.empty?
      new_img = resp.find { |result|
          result["_links"]["thumbnail"] && result["_links"]["thumbnail"]["href"] != "/assets/shared/missing_image.png"
        }["_links"]
        self.update(img_url: new_img["thumbnail"]["href"], img_source: new_img["permalink"]["href"])
    end
  end

  def self.replace_img_urls_from_artsy
    tags_to_update =  DreamTag.all.where(change_image: true)  # DreamTag.all.where(img_url: nil)
    tags_to_update.each { |tag|
      tag.get_image_url_from_artsy
      tag.update(change_image: false)
      puts tag.tag_name
    }
  end

  def self.change_img(id, url, source="")
    DreamTag.find(id).update(img_url: url, img_source: source, change_image: false)
  end

  def self.assign_default_image

  end

end
