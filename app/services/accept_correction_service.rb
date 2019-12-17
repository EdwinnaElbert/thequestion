class AcceptCorrectionService
  attr_accessor :answer, :correction_id, :text

  def initialize(answer, correction_id, text)
    @answer, @correction_id, @text = answer, correction_id, text
  end

  def call
    @diff = Diff::LCS.sdiff(ActionView::Base.full_sanitizer.sanitize(@answer.text).split, @text.html_safe.split)
    unless @diff.nil?
      correction = Correction.find(@correction_id)
      DiffAnswer.create(correction: correction, text: answer_html[0])
      @answer.update_attributes(text: answer_html[1])
      correction.update_attributes(accepted_at: Time.current)
    end
  end

  def answer_html
    new_answer, diff_answer = [], []
    @diff.each do |chunk|
      case chunk.to_a[0]
      when "="
        diff_answer << chunk.to_a.last.last
        new_answer << chunk.to_a.last.last
      when "!"
        diff_answer << removal(chunk.to_a[1].last)
        diff_answer << addition(chunk.to_a[2].last)

        new_answer << chunk.to_a[2].last
      when "+"
        diff_answer << addition(chunk.to_a[2].last)

        new_answer << chunk.to_a[2].last
      when "-"
        diff_answer << removal(chunk.to_a[1].last)
      end
    end
    [diff_answer.join(' '), new_answer.join(' ')]
  end

  def removal(chunk)
    "<span class='red'>" +
    chunk +
    "</span>"
  end

  def addition(chunk)
    "<span class='green'>" +
    chunk +
    "</span>"
  end
end
