class Student
    attr_reader :id
    attr_accessor :name, :email
    @@id = 1
    def initialize (name, email)
        @id = @@id
        @name = name
        @email = email
        # Increment student ID everyone time a student is created
        @@id += 1
    end
end