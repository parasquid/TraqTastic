class User
  include Mongoid::Document
  include Mongoid::Timestamps

  devise :omniauthable, :rememberable

  ## Rememberable
  field :remember_created_at, :type => Time
  field :remember_token

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      u = User.create!(:email => data.email, :password => Devise.friendly_token[0,20])
      self.set_defaults(u)
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
      end
    end
  end

  has_many :timers
  has_many :reports

  private

  def self.set_defaults(u)
    u.timers.create!(
      {
        label: 'Work',
        icon: '/images/icons/glyphicons_086_display@2x.png',
        ordinal: 1,
        color: '#D33132'
      }
    )
    u.timers.create!(
      {
        label: 'Gym',
        icon: '/images/icons/glyphicons_002_dog@2x.png',
        ordinal: 2,
        color: '#FA7D31'
      }
    )
    u.timers.create!(
      {
        label: 'Travel',
        icon: '/images/icons/glyphicons_028_cars@2x.png',
        ordinal: 3,
        color: '#FAB331'
      }
    )
    u.timers.create!(
      {
        label: 'Shopping',
        icon: '/images/icons/glyphicons_202_shopping_cart@2x.png',
        ordinal: 4,
        color: '#FADC00'
      }
    )
    u.timers.create!(
      {
        label: 'Meeting',
        icon: '/images/icons/glyphicons_043_group@2x.png',
        ordinal: 5,
        color: '#B8CF00'
      }
    )
    u.timers.create!(
      {
        label: 'Meals',
        icon: '/images/icons/glyphicons_276_cutlery@2x.png',
        ordinal: 6,
        color: '#3399FF'
      }
    )

    u.reports.create!(
      {
        date: Date.today - 3,
        timers: [
          {
            label: 'Work',
            elapsed_time: 6.hours.to_s
          },
          {
            label: 'Gym',
            elapsed_time: 2.hours.to_s
          },
          {
            label: 'Travel',
            elapsed_time: 1.hour.to_s
          },
          {
            label: 'Sleeping',
            elapsed_time: 8.hours.to_s
          },
          {
            label: 'Meeting',
            elapsed_time: 2.hours.to_s
          },
          {
            label: 'Meals',
            elapsed_time: 3.hours.to_s
          },
        ]
      }
    )
    u.reports.create!(
      {
        date: Date.today - 2,
        timers: [
          {
            label: 'Work',
            elapsed_time: 10.hours.to_s
          },
          {
            label: 'Gym',
            elapsed_time: 2.hours.to_s
          },
          {
            label: 'Travel',
            elapsed_time: 1.hour.to_s
          },
          {
            label: 'Sleeping',
            elapsed_time: 6.hours.to_s
          },
          {
            label: 'Meeting',
            elapsed_time: 1.hour.to_s
          },
          {
            label: 'Meals',
            elapsed_time: 3.hours.to_s
          },
        ]
      }
    )
    u.reports.create!(
      {
        date: Date.today - 1,
        timers: [
          {
            label: 'Work',
            elapsed_time: 4.hours.to_s
          },
          {
            label: 'Gym',
            elapsed_time: 2.hours.to_s
          },
          {
            label: 'Travel',
            elapsed_time: 3.hour.to_s
          },
          {
            label: 'Sleeping',
            elapsed_time: 8.hours.to_s
          },
          {
            label: 'Meeting',
            elapsed_time: 4.hours.to_s
          },
          {
            label: 'Meals',
            elapsed_time: 1.hours.to_s
          },
        ]
      }
    )
    u
  end

end
