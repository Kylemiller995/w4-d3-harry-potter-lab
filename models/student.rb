require_relative('../db/sql_runner.rb')
require_relative('house.rb')



class Student

  attr_accessor :first_name, :second_name, :house_id, :age
  attr_reader :id

  def initialize (profile)
    @id = profile['id'].to_i
    @first_name = profile['first_name']
    @second_name = profile['second_name']
    @house_id = profile['house_id']
    @age = profile['age'].to_i
  end

  def save()
    sql = '
        INSERT INTO students (first_name, second_name, house_id, age)
        VALUES ($1,$2,$3,$4)
        RETURNING id
    '
    values = [@first_name, @second_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    students = SqlRunner.run(sql,values)
    result = students.map {|student| Student.new(student)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    students = SqlRunner.run(sql,values)
    result = Student.new(students[0])
    return result
  end

  def house()
    sql = "SELECT name, id FROM houses WHERE id = $1"
    values = [@house_id]
    house = SqlRunner.run(sql,values)[0]
    return house
  end


end
