class Meeting
  attr_accessor :id, :date
  def inititialize(hash_options)
    @id = hash_options["id"]
    @date = Date.parse(hash_options["date"]) if hash_options["date"]
  end

  def date
    date ? date.strftime('%b %d %Y') : "N/A"
  end

  def self.find(id)
    Meeting.new(Unirest.get("#{ ENV["API_HOST"] }/api/v1/meetings/#{ id }.json").body)
  end
end
