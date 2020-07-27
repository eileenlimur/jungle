class Sale < ActiveRecord::Base

  
  #AR Scope
  def self.active
    where("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current)
  end
  #same thing as lambda:
  # scope :active, -> {where("sales.starts_on < ? AND sales.ends_on >= ?", Date.current, Date.current)}

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def active?
    !upcoming? && !finished?
  end

end
