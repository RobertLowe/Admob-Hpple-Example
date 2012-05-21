class Google
  attr_accessor :controller
  attr_accessor :html

  GOOGLE_URL = "https://www.google.ca/search?q=rubymotion"

  def initialize(controller)
    @controller = controller

    BubbleWrap::HTTP.get(GOOGLE_URL) do |response|
      if response.ok?
        self.handleResponse(response.body.to_str)
      else
        alert("Sorry, unable to fetch status. Try refreshing.")
      end
    end
  end
  
  def handleResponse(response_as_string)
    @html = Hpple.HTML(response_as_string)

    lis = @html.xpath("//li[contains(@class, 'g')]")

    results = []

    lis.each do |li|
      title       = Hpple.HTML(li.to_html).xpath("//a").first.to_s
      href        = Hpple.HTML(li.to_html).xpath("//a").first["href"].to_s.gsub("/url?q=", '')
      
      results << {:title => title, :href => href}
    end

    # Send updated statuses
    @controller.updateResults(results)
  end

end