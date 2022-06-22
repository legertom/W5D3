require_relative './questions.rb'

class Reply 
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM replies 
            WHERE id = ?
        SQL
        Reply.new(*data)
    end

    def self.find_by_user_id(author_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT *
            FROM replies
            WHERE author_id = ?
        SQL
        Reply.new(*data)
    end

    def self.find_by_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT *
            FROM replies
            WHERE question_id = ?
        SQL
        Reply.new(*data)
    end

    def initialize(option)
        @id = option['id']
        @parent_id = option['parent_id']
        @body = option['body']
        @author_id = option['author_id']
        @question_id = option['question_id']
    end

    def author 
        # AUTHOR_ID OR ID?
        User.find_by_id(@id)
    end

    def question 
        Question.find_by_id(@question_id)
    end

    def parent_reply 
        Reply.find_by_id(@parent_id)
    end

    def child_replies 
        # Figure this out later
    end
end