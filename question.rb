require_relative './questions.rb'

class Question 
    
    def find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM questions
            WHERE id = ?
        SQL
        Question.new(*data)
    end

    def self.find_by_author_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM questions 
            WHERE author_id = ?
        SQL
        Question.new(*data)
    end

    def initialize(option)
        @id = option['id']
        @title = option['title']
        @body = option['body']
        @author_id = option['author_id']
    end

    def author 
        User.find_by_id(@author_id)
    end

    def replies
        Reply.find_by_question_id(@id)
    end
end
