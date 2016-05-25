class HsClass < ActiveRecord::Base
  has_many :hs_cards
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
