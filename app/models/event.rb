class Event
  include ActiveModel::Model

  attr_accessor :artist_name, :dates, :longitude, :latitude, :location_name
end
