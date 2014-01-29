module ApplicationHelper

  def formatted_date(date)
    date.strftime("%d-%B-%Y")
  end

  def special_truncate(string)
    string.truncate 200, omission: link_to("Show More", "javascript:void(0)").html_safe
  end

end