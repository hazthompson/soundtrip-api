class FetchEvents
  class << self
    def call
      params = {
        size: 10,
        source: 'ticketmaster',
        classificationId:'KZFzniwnSyZfZ7v7nJ',
      }
      client = Ticketmaster.client(apikey: ENV['TICKETMASTER_API_KEY'])
      response = client.search_events(params: params)
      response.results.map do |result|
        artist = result.attractions.first
        Event.new(artist_name: artist&.name)
      end
    end
  end
end
