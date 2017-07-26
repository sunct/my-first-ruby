module ApplicationHelper
	# 根据页面所定标题返回完整标题
	def full_title(page_title='')
		 base_title='my blog'
		 if page_title.empty?
		 	base_title
		 else
		 	page_title+"|"+base_title
		 end
	end

end
