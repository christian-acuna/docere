class Coach
  @@list = ["juhn", "patrice", "bert"]
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

  def self.replace(old_name, new_name)
    idx = @@list.index(old_name)
    @@list[idx] = new_name
  end

  def self.delete(name)
    @@list.delete(name)
  end
end




