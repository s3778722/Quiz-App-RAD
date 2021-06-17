json.extract! quiz_item, :id, :qid, :question, :description, :answers, :multiple_correct_answers, :correct_answers, :explanation, :tip, :tags, :category, :difficulty, :created_at, :updated_at
json.url quiz_item_url(quiz_item, format: :json)
