---
layout: page
title: About
description: about
---

## Welcome to Jekyll Writer
Jekyll Writer is a simple Jekyll blogging theme with a responsive, mobile-first
layout, stylish monochromatic design, and easy to read typography. You can view the
code in my [Jekyll Writer GitHub] repository.

### Jekyll
[Jekyll] is a powerful static website generator. It takes raw markup files and templates
and compiles them into a complete, static HTML website.

Jekyll also happens to be the engine behind [GitHub Pages] which is easily Jekyll’s
most attractive hosting solution. With it you can simply upload your Jekyll blog
to a free [GitHub] repository and have it automatically compiled and deployed each
time you commit.

### Archives
Check out the [Archives] page to view all the posts.

### Images
Images are added using the [octopress-image-tag] plugin.

{% img post-image {{ site.baseurl }}/img/maine-snowstorm-12.jpg title:"Maine Snowstorm" %}

#### Code
Jekyll also offers powerful support for code snippets:

{% highlight ruby lineos %}
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
               s << "<li><em>#{posts.size}</em><a href=\"#{base_url}/categories/#{cat}\">#{cat}</a></li>"
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

{% endhighlight %}

##### Info
Check out the [Jekyll docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll's GitHub repo][jekyll-gh].


[jekyll-gh]: http://github.com/mojombo/jekyll "Jekyll GitHub repo"
[Jekyll]:    http://jekyllrb.com "Jekyll"
[Jekyll docs]: http://jekyllrb.com/docs/home/ "Jekyll documentation"
[Archives]: {{ site.baseurl }}/archives "Archives"
[GitHub]: http://github.com/ "GitHub"
[GitHub Pages]: http://pages.github.com/ "GitHub Pages"
[Jekyll Writer GitHub]: https://github.com/mjohnq3/jekyll-writer "Jekyll Writer GitHub"
[octopress-image-tag]: https://github.com/octopress/image-tag "Octopress Image Tag"
