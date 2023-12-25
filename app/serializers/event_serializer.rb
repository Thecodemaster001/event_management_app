# frozen_string_literal: true

# Flattens an Event into the attribute object the API returns.
#
# The controllers render only `serializable_hash[:data][:attributes]`, so no
# relationships are declared: a `has_many :users` here cost one `user_ids`
# query per event on every list page while never reaching a response body.
class EventSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :description, :date, :location, :organizer_id
end
