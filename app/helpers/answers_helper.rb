module AnswersHelper

  def sanitize(text)
    ActionView::Base.full_sanitizer.sanitize(text.gsub(/<span class='red_(.+?)<\/span>/, ''))
  end
end
