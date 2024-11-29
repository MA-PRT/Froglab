module ApplicationHelper
  def progress_point(state)
    case state
    when "très basse"
      { number: "10", color:  "#5dc97a" }
    when "basse"
      { number: "25", color:  "#3cdb14" }
    when "moyenne"
      { number: "50", color:  "#FA812F" }
    when "haute"
      { number: "75", color: "#C40C0C" }
    when "très haute"
      { number: "100", color: "#FF0000" }
    end
  end
end
