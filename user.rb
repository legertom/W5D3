require_relative './questions.rb'
require 'byebug'

class User

    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        User.new(*data)
    end

    def self.find_by_name(fname, lname)
    #    debugger
        data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT * 
            FROM users 
            WHERE fname = ?
            AND lname = ?
        SQL
        User.new(*data)
    end

    def initialize(option)
        @id = option['id']
        @fname = option['fname']
        @lname = option['lname']
    end

    def authored_questions
        Question.find_by_author_id(@id)
    end

    def authored_replies
        Reply.find_by_user_id(@id)
    end

end

p User.find_by_name("Chad", "Cattington")
p User.find_by_id(1)