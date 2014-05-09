require 'virtus'

class Group
  include Virtus.model

  attribute :name, String
  attribute :address, String
  attribute :city, String
  attribute :state, String
  attribute :zip, String
  attribute :lat, Float
  attribute :long, Float
  attribute :email, String
  attribute :phone, String
  attribute :meeting_wday, Integer
end
