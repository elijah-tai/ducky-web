module GroupsHelper
	def target_group_options(chosen_group = nil)
  s = ''
  Group.all.each do |group|
    s << "<option value='#{group.id}' #{'selected' if group == chosen_group}>#{group.name}</option>"
  end
	  s.html_safe
	end
end
