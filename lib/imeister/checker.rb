module Imeister
  class Checker
    DATE_REGEXP = '\Estimated Expiration Date:(.*)'
    STATUSES = [:green, :yellow]

    STATUSES.each do |status|
      define_method("#{status}?") do |class_name|
        class_name == "status #{status}"
      end
    end

    def initialize(div)
      @div = div
    end

    def warranty
      if green?(@div.class_name)
        expiration_date
      elsif yellow?(@div.class_name)
        'Out of warranty'
      else
        'Some error occurred, please try again'
      end
    end

    def expiration_date
      Time.parse(@div.p.text.match(DATE_REGEXP).to_s).strftime('%d %B %Y')
    end
  end
end
