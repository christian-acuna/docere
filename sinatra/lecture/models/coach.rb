class Coach
  @@list = ["john", "patrick,", "albert"]
  def self.all
    @@list
  end

  def self.create(name)
    @@list << name
  end
end