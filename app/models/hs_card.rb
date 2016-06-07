
class HsCard < ActiveRecord::Base

  belongs_to :rarity
  belongs_to :hs_class
  belongs_to :extension
  belongs_to :type
  belongs_to :group
  has_many :deck_hs_cards
  has_many :decks, through: :deck_hs_cards
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  filterrific(
      default_filter_params: { sorted_by: 'hs_card_name_asc' },
      available_filters: [
          :sorted_by,
          :search_query,
          :with_hs_class_name,
          :with_extension_name,
          :with_rarity_name,
          :with_type_name,
          :with_group_name
      ]
  )

  scope :search_query, lambda { |query|

    return nil  if query.blank?

    terms = query.downcase.split(/\s+/)

    terms = terms.map { |e|
      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    }

    num_or_conds = 2
    where(
        terms.map { |term|
          "(LOWER(hs_cards.name) LIKE ? OR LOWER(hs_cards.name) LIKE ?)"
        }.join(' AND '),
        *terms.map { |e| [e] * num_or_conds }.flatten
    )

  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s

      when /^hs_card_name_/

        order("hs_cards.name #{ direction }")

      when /^hs_card_cost/

        order("hs_cards.cost #{ direction }")

      when /^hs_card_attack_points/

        order("hs_cards.attack_points #{ direction }")

      when /^hs_card_life_points/

        order("hs_cards.life_points #{ direction }")

      else
        raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end

  }
  scope :with_hs_class_name, lambda { |hs_class_name|
    where(hs_class: hs_class_name )
  }

  scope :with_extension_name, lambda { |extension_name|
    where(extension: extension_name )
  }

  scope :with_rarity_name, lambda { |rarity_name|
    where(rarity: rarity_name )
  }

  scope :with_type_name, lambda { |type_name|
    where(type: type_name )
  }

  scope :with_group_name, lambda { |group_name|
    where(group: group_name )
  }

  def self.options_for_sorted_by
    [
        ['Nom ', 'hs_card_name_asc'],
        ['Coût ', 'hs_card_cost_asc'],
        ['Attaque ', 'hs_card_attack_points_asc'],
        ['Points de vie ', 'hs_card_life_points_asc'],
    ]
  end
  acts_as_commontable

end
