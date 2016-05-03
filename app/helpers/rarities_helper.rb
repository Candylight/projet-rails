module RaritiesHelper
  def rarity_badge(name,color)
    raw "<span class='badge' style='background: #{color}'>
        #{name}
    </span>
"
  end
end
