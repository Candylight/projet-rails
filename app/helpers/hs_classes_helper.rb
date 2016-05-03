module HsClassesHelper
  def hs_class_badge(name,color)
    raw "<span class='badge' style='background: #{color}'>
        #{name}
    </span>
"
  end
end
