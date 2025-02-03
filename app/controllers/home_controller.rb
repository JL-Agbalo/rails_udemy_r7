class HomeController < ApplicationController
    def index  
        # Log a debug message
        Rails.logger.debug "This is a debug message"

        # Log an info message
        Rails.logger.info "This is an info message"

        # Log a warning message
        Rails.logger.warn "This is a warn message"

        # Log an error message
        Rails.logger.error "This is an error message"

        # Log a fatal message
        Rails.logger.fatal "This is a fatal message"
    end 

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

    def loopThoughArrays
        # console
    @products = [
        { name: "MacBook Pro", brand: "Apple", processor: "M1", ram: "16GB", storage: "512GB SSD", price: 2399, quantity: 10 },
        { name: "XPS 13", brand: "Dell", processor: "Intel i7", ram: "16GB", storage: "1TB SSD", price: 1499, quantity: 15 },
        { name: "ThinkPad X1 Carbon", brand: "Lenovo", processor: "Intel i7", ram: "16GB", storage: "512GB SSD", price: 1799, quantity: 8 },
        { name: "Spectre x360", brand: "HP", processor: "Intel i7", ram: "16GB", storage: "1TB SSD", price: 1599, quantity: 12 },
        { name: "Surface Laptop 4", brand: "Microsoft", processor: "AMD Ryzen 7", ram: "16GB", storage: "512GB SSD", price: 1299, quantity: 20 }
    ]
    # debugger
    end
end