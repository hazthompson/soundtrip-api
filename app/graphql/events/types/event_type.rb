module Events
  module Types
    class EventType < ::Types::BaseObject
      field :ticketmaster_id, String, null: false
      field :artist_name, String, null: true
      field :date, GraphQL::Types::ISO8601Date, null: true
      field :venue, String, null: true
      field :url, String, null: true
      field :image_url, String, null: true
    end
  end
end
