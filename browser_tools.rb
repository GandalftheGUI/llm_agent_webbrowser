require 'selenium-webdriver'

class BrowserTools
  TOOLS = [
    {
      name: "navigate",
      description: "Navigate to a given URL.",
      input_schema: {
        type: "object",
        properties: {
          url: { type: "string", description: "The URL to navigate to" }
        },
        required: ["url"]
      }
    },
    {
      name: "click",
      description: "Click an element by CSS selector.",
      input_schema: {
        type: "object",
        properties: {
          selector: { type: "string", description: "CSS selector for the element to click" }
        },
        required: ["selector"]
      }
    },
    {
      name: "fill_textbox",
      description: "Fill a text box by CSS selector.",
      input_schema: {
        type: "object",
        properties: {
          selector: { type: "string", description: "CSS selector for the textbox" },
          text: { type: "string", description: "Text to fill in" }
        },
        required: ["selector", "text"]
      }
    },
    {
      name: "get_page_source",
      description: "Get the current page source.",
      input_schema: {
        type: "object",
        properties: {},
        required: []
      }
    }
  ]

  TOOL_METHOD_NAMES = TOOLS.map { |tool| tool[:name] }

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def tools
    TOOLS
  end

  def run_tool(tool_name, params)
    unless TOOL_METHOD_NAMES.include?(tool_name) && respond_to?(tool_name, true)
      raise "Unknown or unauthorized tool: #{tool_name}"
    end
    send(tool_name, params)
  end

  private

  def navigate(params)
    url = params[:url] || params["url"]
    return error("URL is required") unless url
    @driver.navigate.to(url)
    success("Navigated to #{url}")
  end

  def click(params)
    selector = params[:selector] || params["selector"]
    return error("Selector is required") unless selector
    begin
      el = @driver.find_element(css: selector)
      el.click
      success("Clicked element #{selector}")
    rescue Selenium::WebDriver::Error::NoSuchElementError
      error("Element not found: #{selector}")
    end
  end

  def fill_textbox(params)
    selector = params[:selector] || params["selector"]
    text = params[:text] || params["text"]
    return error("Selector and text are required") unless selector && text
    begin
      el = @driver.find_element(css: selector)
      el.clear
      el.send_keys(text)
      success("Filled textbox #{selector} with '#{text}'")
    rescue Selenium::WebDriver::Error::NoSuchElementError
      error("Textbox not found: #{selector}")
    end
  end

  def get_page_source(_params)
    { success: true, page_source: @driver.page_source }.to_s
  end

  def error(msg)
    { success: false, error: msg }.to_s
  end

  def success(msg)
    { success: true, message: msg }.to_s
  end
end 