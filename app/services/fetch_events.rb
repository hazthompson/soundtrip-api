class FetchEvents
  class << self
    def call(start_date:, lat:, lng:)
      params = {
        size: 10,
        source: 'ticketmaster',
        startDateTime: start_date.to_datetime,
        latlong: "#{lat},#{lng}",
        sort:'date,asc',
        classificationId:'KZFzniwnSyZfZ7v7nJ',
      }
      client = Ticketmaster.client(apikey: ENV['TICKETMASTER_API_KEY'])
      response = client.search_events(params: params)
      response.results.map do |result|
        artist = result.attractions.first
        date = result.dates['start']
        venue = result.venues.first
        image = result.images.first
        Event.new(
          artist_name: artist&.name,
          date: date ? date['localDate'] : null,
          venue: venue&.name,
          url: result.data['url'],
          image_url: image&.url,
        )
      end
    end
  end
end
