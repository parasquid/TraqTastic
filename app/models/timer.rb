class Timer
  include Mongoid::Document
  include Mongoid::Timestamps

  default_scope order_by(:ordinal => :asc)

  field :label, type: String
  field :icon, type: String
  field :ordinal, type: Integer
  field :active_since, type: Time
  field :color, type: String, default: '#00ff00'
  field :elapsed_time, type: BigDecimal, default: 0
  field :active, type: Boolean, default: false

  belongs_to :user

  def is_active?
    !!self.active
  end

  def toggle
    if is_active?
      self.active = false
      self.elapsed_time += (Time.now - self.active_since)
    else
      self.active = true
      self.active_since = Time.now
    end
    self.save!
  end

end
