module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :users, [Users::Types::UserType], null: false
    field :events, [Events::Types::EventType], null: false do
      description 'get events by date and location'
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :lat, String, required: true
      argument :lng, String, required: true
    end

    def users
      User.all
    end

    def events(start_date: Time.now, lat:, lng:)
      puts "\n DATE IS #{start_date}\n"
      FetchEvents.call(start_date: start_date, lat: lat, lng: lng)
    end
  end
end
