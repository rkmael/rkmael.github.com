class Slideshare < Liquid::Tag
  Syntax = /^\s*([^\s]+)(\s+(\d+)\s+(\d+)\s*)?/

  def initialize(tagName, markup, tokens)
    super

    if markup =~ Syntax then
      @id = $1

      if $2.nil? then
          @width = 560
          @height = 420
      else
          @width = $2.to_i
          @height = $3.to_i
      end
    else
      raise "No Slideshare ID provided in the \"slideshare\" tag"
    end
  end

  def render(context)
    "<iframe style=\"border: 1px solid #CCC; border-width: 1px; margin-bottom: 5px; max-width: 100%;\" 
    src=\"//www.slideshare.net/slideshow/embed_code/#{@id}\" width=\"#{@width}\" height=\"#{@height}\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" allowfullscreen=\"allowfullscreen\"> </iframe>"
  end

  Liquid::Template.register_tag "slideshare", self
end