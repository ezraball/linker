class Clip < ApplicationRecord
  validates :title, presence: true
  serialize :fetch_response
    
  def self.new_from_url(url,user = nil)
    clip = Clip.new
    if url
      uri = URI(url)
      clip.fetch_response = Net::HTTP.get_response(uri)
      if clip.fetch_response
        html_doc = Nokogiri::HTML(clip.fetch_response.body)

        clip.title = html_doc.xpath('//meta[@property="og:title"]/@content')
        clip.title = html_doc.title.strip if clip.title.blank? && html_doc.title

        unescaped_content = html_doc.xpath('//meta[@property="og:description"]/@content')
        unescaped_content = html_doc.xpath('//meta[@name="description"]/@content') if unescaped_content.blank?
        # escaping double escaped html entities
        clip.description = HTMLEntities.new.decode(flatten_double_encoded(unescaped_content))

        clip.link = html_doc.xpath('//link[@rel="canonical"]/@href') # try the canonical link meta tag first; this will get the right URL if the publisher has set it and the url entered is a mobile url, for example.
        clip.link = url if clip.link.blank? #otherwise, fall back to the URL as the author entered it

        clip.pub_date = html_doc.xpath('//meta[@itemprop="datePublished"]/@content')
        #TODO: try some other things first before resorting to just using today, which is a stupid way to do it
        clip.pub_date = DateTime.now if clip.pub_date.blank?

        clip.link_date = DateTime.now

        clip.source_name = html_doc.xpath('//meta[@property="og:site_name"]/@content')
        #TODO: add a fallback way to find the site name
        clip.source_url = uri.host
      end
    end
    clip
  end

  private
  def self.flatten_double_encoded(html)
    html.to_s.html_safe.gsub('&amp;','&')
  end
end
