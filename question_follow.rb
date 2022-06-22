require_relative './questions.rb'

class QuestionFollow
    def self.find_by_id(id)
        data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT *
            FROM question_follows
            WHERE id = ?
        SQL
        QuestionFollow.new(*data)
    end

    def self.followers_for_question_id(question_id)
        data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT *
            FROM users
            JOIN question_follows
            ON users.id = question_follows.user_id
            WHERE question_id = ?

        SQL
        data.map { |datum| User.new(datum) }
    end

    def initialize(option)
        @id = option['id']
        @user_id = option['user_id']
        @question_id = option['question_id']
    end

end