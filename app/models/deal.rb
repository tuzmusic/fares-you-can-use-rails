require_relative 'deal/convenience_methods'
require_relative 'deal/utilities'
require_relative 'deal/diagnostics'
require_relative 'deal/filters'
require_relative 'deal/seed'

class Deal < ApplicationRecord
  validates :headline, presence: :true
  validates :description, presence: :true

  has_many :deal_origins, dependent: :destroy
  has_many :origins, through: :deal_origins, source: :airport

  has_many :deal_destinations, dependent: :destroy
  has_many :destinations, through: :deal_destinations, source: :airport

  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :preference
  
  belongs_to :region, optional: true
  has_many :links
  accepts_nested_attributes_for :links, reject_if: :all_blank, allow_destroy: true

  # ------ SCOPE METHODS --------
  scope :current, -> { where('end_date > ?', Date.today) }

  # ------ METHODS --------
  def probably_expired?
    posted_date < Date.today - 7 if posted_date
  end

  def destinations=(airports)
    destinations.clear
    airports.each do |airport|
      destinations << airport
    end
    set_region
  end

  # ------ SLUG --------
  include Slugifiable::InstanceMethods
  
  after_save do |deal|
    deal.set_region if !region_id
    deal.posted_date ||= Date.today
    deal.set_slug if !slug && deal.headline
  end

  def set_slug
    update(slug: slug_for(headline.gsub(' - ',' ').gsub('/',' ')))
  end

  def to_param() slug end

  # ------ REGION --------
  def region
    Region.find_by(id: region_id) || set_region
  end

  def region_name
    region.name
  end

  def set_region
    if f = destinations.first 
      update(region: f.region)
      self.region
    end
  end
end

