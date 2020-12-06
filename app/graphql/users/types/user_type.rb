module Users
  module Types
    class UserType < ::Types::BaseObject
      field :id, ID, null: false
      field :first_name, String, null: true
      field :last_name, String, null: true
    end
  end
end 