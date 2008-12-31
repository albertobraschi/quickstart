# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
	# print javascript for each item in array of files in head section
	def javascript(*files)
		content_for(:javascripts) { javascript_include_tag(*files) } 
	end
	
	# print stylesheet for each item in array of files in head section
	def stylesheet(*files)
		content_for(:stylesheets) { stylesheet_link_tag(*files) } 
	end

  # generate h1 for each page
	def page_header(text=SITE_NAME)
    content_for(:page_header)do
      content_tag(:h1, text)
    end
	end
  
end
