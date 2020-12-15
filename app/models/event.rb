class Event
  include ActiveModel::Model

  attr_accessor :artist_name, :date, :longitude, :latitude, :location_name, :venue, :url, :image_url, :date
end
