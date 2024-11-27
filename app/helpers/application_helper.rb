module ApplicationHelper
  def progress_bar(state)
    case state
    when "very_low"
      { number: "10", color:  "#1F4529" }
    when "low"
      { number: "25", color:  "#6EC207" }
    when "medium"
      { number: "50", color:  "#FA812F" }
    when "high"
      { number: "75", color: "#C40C0C" }
    when "very_high"
      { number: "100", color: "#FF0000" }
    end
  end
end
