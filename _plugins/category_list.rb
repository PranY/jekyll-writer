module Jekyll
  class CategoryList < Liquid::Tag
    def render(context)
      s = StringIO.new
      begin
        base_url = context['site']['baseurl']
        categories = context['site']['categories']
        unless categories.nil?
          post_count = context['site']['posts'].size.to_i
          categories.sort_by { |cat, posts| posts.size }
            .reverse()
            .each do |cat, posts|
               s << "<a href=\"#{base_url}/categories/#{cat}\">#{cat}&nbsp;<em>#{posts.size}</em></a>"
            end
        end
      rescue => boom
        p boom
      end
      "#{s.string}"
    end
  end
end

Liquid::Template.register_tag('category_list', Jekyll::CategoryList) 
