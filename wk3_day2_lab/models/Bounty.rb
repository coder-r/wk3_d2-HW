require('pg')

#
# Write your class definition
#  in the file - initialize, attr_readers,
#   instance variables

class Bounty

  attr_reader :id
  attr_accessor :name, :favourite_weapon, :bounty_values, :danger_level

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @favourite_weapon = options['favourite_weapon']
    @bounty_values = options['bounty_values'].to_i
    @danger_level = options['danger_level']
  end

  def save()
    db = PG.connect({dbname: 'bounty', host: 'localhost'})
    sql = "INSERT INTO bounty (name, favourite_weapon, bounty_values, danger_level) VALUES ($1, $2, $3, $4) RETURNING ID"
    values = [@name, @favourite_weapon, @bounty_values, @danger_level]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    @id = result[0]['id'].to_i()
    db.close()
  end

  def update()
    db = PG.connect({
      dbname: "bounty",
      host: "localhost"
      })

      sql = "UPDATE bounty SET
      (name, favourite_weapon, bounty_values, danger_level)
      = ($1, $2, $3, $4) WHERE id = $5
      "
      values = [@name, @favourite_weapon, @bounty_values, @danger_level, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close
    end

    def delete()
      db = PG.connect({dbname: "bounty", host: "localhost"})
      sql = "DELETE FROM bounty WHERE id = $1"
      values = [@id]
      db.prepare('delete_one', sql)
      db.exec_prepared('delete_one', values)
      db.close()
    end

    def Bounty.find_by_name(finding_name)
      db = PG.connect({dbname: "bounty", host: "localhost"})
      sql = "SELECT name FROM bounty WHERE name = $1"
      values = [finding_name]
      db.prepare('find_by_name', sql)
      result = db.exec_prepared('find_by_name', values)
      db.close()
      return result
    end




  end
