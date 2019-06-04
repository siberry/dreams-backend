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
end
