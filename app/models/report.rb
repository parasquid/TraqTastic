class Report
  include Mongoid::Document
  include Mongoid::Timestamps

  field :date, type: Date
  field :timers, type: Array #of hashes

  belongs_to :user
end
