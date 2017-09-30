class MeetingsController < ApplicationController

  def index
    @meetings = []

  Unirest.get("#{ ENV["API_HOST"] }/api/v1/meetings.json").body.each do |meeting_hash|
    @meeting << Meeting.new(meeting_hash)
  end

  def new

  end

  def create
    meeting = Unirest.post(
                            "#{ ENV["API_HOST"] }/api/v2/meetings.json?date=#{params[:time]},
                            headers: {
                                      "Accept" => "application/json"
                                      }
                            ).body

    redirect_to "/meetings/#{meeting["id"]}"
  end


  def show
    @meeting = Unirest.get("localhost:3000/api/v2/meetings/#{params[:id]}.json").body
  end

  def edit
   @meeting = Meeting.find(params[:id])
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting = Meeting.patch(date: params[:time])
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting = Meeting.destroy(params[:id])
  end
end

