class Coach
  @@list = ["john", "patrick", "albert"]
  def self.all
    @@list
  end

  def self.create(name)
    @@list << name
  end

  def self.find_by_name(name)
    if @@list.include?(name)
      return name
    end
  end
end