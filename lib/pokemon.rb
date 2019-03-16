require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp:nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO pokemon (name, type) VALUES ( ?, ? );", [name, type])
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?; id").flatten
    new_pokemon = Pokemon.new(id:id, name:new_pokemon_name[0][0], type:new_pokemon_type[0][0], db:db)
  end

  def alter_hp(hp, db)
    binding.pry
    db.execute( "UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])
  end
end
