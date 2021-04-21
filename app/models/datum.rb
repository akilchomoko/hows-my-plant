class Datum < ApplicationRecord
  belongs_to :device
  belongs_to :plant
end
