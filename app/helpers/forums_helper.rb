module ForumsHelper
  def forum_name(forum)
    forum.name.nil? || forum.name.blank? ? "Forum ##{forum.id}" : forum.name
  end

  def section_name(section)
    section.name.nil? || section.name.blank? ? "Section ##{section.id}" : section.name
  end
  
  def add_section_link(name)
    link_to_function name  do |page|
      page.insert_html :bottom, :sections, :partial => 'section', :object => Section.new
    end
  end

end
