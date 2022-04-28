class Resume < ActiveRecord::Base
  belongs_to :user
  has_one_attached :avatar
  include Rails.application.routes.url_helpers

  def avatar_url
    Rails.application.routes.url_helpers.url_for(avatar)
  end
end