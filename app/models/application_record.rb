class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  serialize :answers, Hash
  serialize :correct_answers, Hash
  serialize :tags, Array
end
