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

  def get_JSON_response(url)
    response = RestClient.get(url,
      headers={
        
      }
    )
    parsed = JSON.parse(response)
    return parsed
  end

  def getImageUrl

  end
end
