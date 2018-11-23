# Jekyll Plugin - Insane Vk-video Embed
#
# Author: Sergey Melnikov - https://github.com/MelnikovSergey

module Jekyll
  class Vk < Liquid::Tag
    @vk_video_params = nil

    VIDEO_URL = /[0-9]+.+/

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ VIDEO_URL
        @vk_video_params = markup
      end
    end

    def render(context)
      output = "<div class=\"video\">"
      output += "<figure>"
      output += "<iframe src=\"https://vk.com/video_ext.php?oid=-#{@vk_video_params}\" width=\"640\" height=\"360\" frameborder=\"0\" allowfullscreen></iframe>"
      output += "</figure>"
      output += "</div>"
    end
  end
end

Liquid::Template.register_tag('vk', Jekyll::Vk)
