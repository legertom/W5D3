require_relative './questions.rb'
require 'byebug'

class User

    def self.find_by_id(id)
        QuestionsDatabase.instance.execute(<<-SQL, @id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
    end

    def self.find_by_name(fname, lname)
        debugger
        QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
            SELECT * 
            FROM users 
            WHERE fname = ?
            AND lname = ?
        SQL
    end

    def initialize(option)
        @id = option['id']
        @fname = option['fname']
        @lname = option['lname']
    end


end