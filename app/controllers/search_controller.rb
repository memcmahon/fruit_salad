class SearchController < ApplicationController
    def index
        state = params[:state]

        conn = Faraday.new(url: "https://api.congress.gov") do |faraday|
            faraday.headers["X-API-Key"] = Rails.application.credentials.congress[:key]
        end

        response = conn.get("/v3/member/congress/118")

        json = JSON.parse(response.body, symbolize_names: true)

        @members_by_state = []
        json[:members].each do |member_info|
            @members_by_state << member_info if member_info[:state] == state
        end
    end
end