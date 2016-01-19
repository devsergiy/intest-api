class PersonMovie < ActiveRecord::Base
  belongs_to :movie
  belongs_to :person

  enum person_role: %i(actor director writer)
end
