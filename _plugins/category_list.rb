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
               cat1 = cat.gsub(/_|\P{Word}/, '-').gsub(/-{2,}/, '-')
               cat2 = cat.gsub(/\w+/) do |word|
                 word.capitalize
               end
               s << "<li><a href=\"#{base_url}/categories/#{cat1}\">#{cat2}&nbsp;<em>#{posts.size}</em></a></li>"
            end
        end
      rescue => boom
        p boom
      end
      "<ul>#{s.string}</ul>"
    end
  end
end

Liquid::Template.register_tag('category_list', Jekyll::CategoryList) 
