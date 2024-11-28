module ApplicationHelper
  def progress_point(state)
    case state
    when "very_low"
      { number: "10", color:  "#5dc97a" }
    when "low"
      { number: "25", color:  "#3cdb14" }
    when "medium"
      { number: "50", color:  "#FA812F" }
    when "high"
      { number: "75", color: "#C40C0C" }
    when "very_high"
      { number: "100", color: "#FF0000" }
    end
  end
end
