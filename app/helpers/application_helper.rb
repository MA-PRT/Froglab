module ApplicationHelper
  def progress_point(state)
    progress_mapping = {
      "basse" => { number: "25", color: "#5dc97a" },
      "moyenne" => { number: "50", color: "#FFC107" },
      "haute" => { number: "75", color: "#FF0000" },
    }

    progress_mapping[state]
  end



  # def render_status_switch(action)
  #   status_class = action.status == "en cours" ? "card-tkt-show-encours-txt" : "card-tkt-show-resolu-txt"
  #   action.status == "complétée" ? "checked" : ""

  #   content_tag(:span, action.status.capitalize, class: status_class, data: { switch_status_target: "status" }) +
  #     content_tag(:label, class: "switch") do
  #       check_box_tag("", "", action.status == "complétée", data: { action: "change->switch-status#switch" }) +
  #         content_tag(:span, "", class: "slider round")
  #     end
  # end
end
