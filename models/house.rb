require_relative('../db/sql_runner.rb')


class House

  attr_accessor :name, :url
  attr_reader :id

  def initialize (details)
    @id = details['id'].to_i
    @name = details['name']
    @image = details['image']
  end

  def save()
    sql = '
        INSERT INTO houses (name, image)
        VALUES ($1,$2)
        RETURNING id
    '
    values = [@name, @image]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM houses WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM houses;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM houses"
    values = []
    houses = SqlRunner.run(sql,values)
    result = houses.map {|house| House.new(house)}
    return result
  end

  def self.find(id)
    sql = "Select * FROM houses WHERE id = $1"
    values = [id]
    houses = SqlRunner.run(sql,values)
    result = House.new(houses)[0]['name']
    return result
  end


end
