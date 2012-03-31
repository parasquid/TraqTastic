class User
  include Mongoid::Document

  devise :omniauthable

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.extra.raw_info
    if user = User.where(:email => data.email).first
      user
    else # Create a user with a stub password.
      u = User.create!(:email => data.email, :password => Devise.friendly_token[0,20])
      u.timers.create!(
        {
          label: 'Work',
          icon: '/images/icons/glyphicons_023_cogwheels.png',
          ordinal: 1
        }
      )
      u.timers.create!(
        {
          label: 'Gym',
          icon: '/images/icons/glyphicons_282_cardio.png',
          ordinal: 2
        }
      )
      u.timers.create!(
        {
          label: 'Travel',
          icon: '/images/icons/glyphicons_028_cars.png',
          ordinal: 3
        }
      )
      u.timers.create!(
        {
          label: 'Shopping',
          icon: '/images/icons/glyphicons_202_shopping_cart.png',
          ordinal: 4
        }
      )
      u.timers.create!(
        {
          label: 'Meeting',
          icon: '/images/icons/glyphicons_244_conversation.png',
          ordinal: 5
        }
      )
      u.timers.create!(
        {
          label: 'Meals',
          icon: '/images/icons/glyphicons_276_cutlery.png',
          ordinal: 6
        }
      )

      u
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

end
