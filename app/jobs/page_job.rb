class PageJob < ApplicationJob
  queue_as :default

  def perform(page)
    parsed_page = MetaInspector.new(page.url)
    return nil if parsed_page.response.status != 200
    parsed_page.links.raw.each do |link|
      page.links.create(url: link)
    end
    parsed_page.parsed.css('h1, h2, h3').each do |title|
      page.headers.create(header_type: title.name, content: title.text)
    end
    page.parsed!
  end
end
