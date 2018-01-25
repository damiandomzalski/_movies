class TitleBracketsValidator < ActiveModel::Validator

  def validate(record)
    @record = record
    @title = record.title
    add_error unless @title.present?
    check_brackets
  end

  def check_brackets
    stack_brackets = []
    text = []
    brackets = { '{' => '}', '[' => ']', '(' => ')' }

    @title.each_char do |c|
      add_error if brackets.key(c) && text.size.zero?
      brackets.key?(c) ? stack_brackets << c && text = [] : text << c
      add_error if brackets.key(c) && brackets.key(c) != stack_brackets.pop
    end
    add_error if !stack_brackets.empty?
  end


  def add_error
    return if @record.errors.details.key?(:title)
    @record.errors.add(:title, 'Please verify the title with brackets, they should be closed and should not be empty')
  end

end
