class Pokemon
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO pokemon (name, type) VALUES ( ?, ? );", [name, type])
  end

  def self.find(id, db)
    new_pokemon_id = db.execute("SELECT id FROM pokemon WHERE id = id;")
    new_pokemon_name = db.execute("SELECT name FROM pokemon WHERE id = id;")
    new_pokemon_type = db.execute("SELECT type FROM pokemon WHERE id = id;")

    Pokemon.new(id:id, name:new_pokemon_name, type:new_pokemon_type, db:db)
  end

end
