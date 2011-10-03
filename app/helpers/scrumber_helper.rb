module ScrumberHelper
 
  def draw_statuses_on_dashboard(statuses)
    statuses.map {|status| 
      "<th class='issue_status_#{status.id} #{cycle 'odd', 'even'}'>#{status.name}</th>" 
    }.join
  end
  
  def draw_issue_on_dashboard(issue, statuses)
    statuses.map {|status| 
      draw_issue_status_on_dashboard(issue, status) 
    }.join
  end
  
  private
  def draw_issue_status_on_dashboard(issue, status)
    fill = if issue.status_id == status.id 
      render :partial => 'issue', :object => issue
    else
      '&nbsp;'
    end
    "<td class='issue_status_#{status.id}' id='issue_status_#{status.id}_for_#{issue.id}'>#{fill}</td>"
  end
  
end
