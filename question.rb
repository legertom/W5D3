require_relative './questions.rb'

class Question 

    def self.find_by_author_id(author_id)
        QuestionsDatabase.instance.execute(<<-SQL, @author_id)
            SELECT *
            FROM questions 
            WHERE author_id = ?
        SQL
    end

    def initialize(option)
        @id = option['id']
        @title = option['title']
        @body = option['body']
        @author_id = option['author_id']
    end
end
