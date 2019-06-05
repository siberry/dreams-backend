class DreamTag < ApplicationRecord
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

  def get_pixabay_JSON_response(url)
    response = RestClient.get(url)
    parsed = JSON.parse(response)
    parsed
  end

  def get_artsy_JSON_response(url)
    response = RestClient.get(url, headers={
      "X-Xapp-Token" => ArtsyXappToken.latest_artsy_toke
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

  def get_image_url_from_artsy
    resp = self.get_artsy_JSON_response("https://api.artsy.net/api/search?q=#{self.tag_name}")["_embedded"]["results"]
    new_img = resp.find { |result|
      result["_links"]["thumbnail"] && result["_links"]["thumbnail"]["href"] != "/assets/shared/missing_image.png"
    }["_links"]
    self.update(img_url: new_img["thumbnail"]["href"], img_source: new_img["permalink"]["href"])
  end

  def self.replace_img_urls_from_artsy
    tags_to_update =   DreamTag.all.where(change_image: true) #DreamTag.all.where(img_url: nil)
    tags_to_update.each { |tag|
      tag.get_image_url_from_artsy
      tag.update(change_image: false)
    }
  end
end
