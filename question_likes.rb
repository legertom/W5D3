require_relative './questions.rb'

class QuestionLike
    def self.find_by_id(id)
        data  = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * 
            FROM question_likes
            WHERE id = ?
        SQL
        QuestionLike.new(*data)
    end

    def initialize(option)
        @id = option['id']
        @likes = option['likes']
        @user_id = option['user_id']
        @question_id = option['question_id']
    end
end