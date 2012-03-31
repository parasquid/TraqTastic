class Timer
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope order_by(:ordinal => :asc)

  field :label, type: String
  field :icon, type: String
  field :ordinal, type: Integer
  field :color, type: String, default: 'Blue'
  field :elapsed_time, type: BigDecimal, default: 0
  field :is_active?, type: Boolean, default: false

  belongs_to :user

end
