class Recipe
  include HTTParty

  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  default_params key: key_value, fields: "image_url,title,social_rank"
  base_uri "http://#{hostport}/api"
  format :json

  def self.for keyword
    get("/search", query: { q: keyword } )["recipes"]
  end
end

