class HomeController < ApplicationController
    def getQueryStringValues
        message = ""
        if params[:message]
            message += "<h2>Message: #{params[:message]}</h2>"
        else
            message += "<h2>Message: No message</h2>"
        end

        if params[:country]
            message += "<h2>Country: #{params[:country]}</h2>"
        else
            message += "<h2>Country: No country</h2>"
        end

        message += "<h2>controller: #{params[:controller]}</h2>"
        message += "<h2>Action: #{params[:action]}</h2>"

        render html: message.html_safe
    end

    def getPassDataToViews
        @message = "<h1>Passing data to views</h1>"
    end

    def showDateTimeInfo
    @currentTime = Time.now
    end

    def conditionalRendering
    @data = {
        name: "John Doe",
        visible: true,
        logged_in: true,
        country_code: "US",
        work_experience: 5,
        state_code: "CA"
    }
    end
end