class ArtsyXappToken < ApplicationRecord
  def self.get_token
    client_id = 'b9ee0aabb3e34b7c9d9f'
    client_secret = '06fd99eaf1e03c59174eef55c5b98132'
    api_url = URI.parse('https://api.artsy.net/api/tokens/xapp_token')
    response = Net::HTTP.post_form(api_url, client_id: client_id, client_secret: client_secret)
    attributes = JSON.parse(response.body)
    ArtsyXappToken.create(token: attributes["token"], expires_at: attributes["expires_at"])
  end

  def expired?
    ArtsyXappToken.all.last
  end
end
