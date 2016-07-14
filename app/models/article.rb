class Article < ActiveRecord::Base
  default_scope -> { order('created_at DESC') }

  # association
  belongs_to :admin

  # validation
  validates :headline,  presence: true, length: { within: 3..255 }
  validates :intro,     presence: true, length: { within: 5..1000 }
  validates :body,      presence: true, length: { maximum: 10000 }

  # FriendlyId
  extend FriendlyId
  friendly_id :headline, use: [:slugged, :history]
  def should_generate_new_friendly_id?
    headline_changed?
  end

end
