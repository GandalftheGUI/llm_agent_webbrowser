# llm_agent_webbrowser

This project is a demonstration of an LLM-controlled browser agent. It allows a large language model (LLM) connected via Model Context Protocal (MPC) to interact with and control a Chrome web browser in real time, using natural language.

Here is an example of finding the current date and time from a website:
```
Control a web browser with Claude Sonnet 4 (type '/q' to quit):
🙋‍♂️ You: navigate to a website and find the current date and time
🤖 Claude: I'd be happy to help you navigate to a website to find the current date and time. However, I need you to specify which website you'd like me to navigate to.

Some common options for checking date and time include:
- time.gov
- timeanddate.com
- worldclock.com
- google.com (which often displays current time)

Which website would you prefer, or do you have a specific URL in mind?
🙋‍♂️ You: time.gov sounds good
🛠️ Tool request from claud: navigate({:url=>"https://time.gov"})
🤖 Claude: Now let me get the page content to find the current date and time displayed on the site:
🛠️ Tool request from claud: get_page_source({})
🤖 Claude: Great! I successfully navigated to time.gov and retrieved the page content. Based on the HTML source, I can see the current date and time information displayed on the site:

**Current Date and Time from time.gov:**

**Date:** Today: 07/24/2025

**Times by US Time Zone:**
- **Eastern Daylight Time (EDT):** 08:04:04 P.M.
```

## Overview

- The agent uses an LLM (Anthropic Claude Sonnet 4) to interpret user input and decide on browser actions.
- Browser automation is powered by Selenium WebDriver (Chrome, visible mode).
- The agent exposes a set of browser tools that the LLM can use to:
  - Navigate to a web page
  - Click on elements (by CSS selector)
  - Fill in text boxes (by CSS selector)
  - Retrieve the current page source

## Usage

- Start the agent and interact via the command line.
- The LLM can be prompted to perform browser actions, and will use the available tools to do so.
- Designed for experimentation, extension, and as a foundation for more advanced LLM-browser integrations.

## Requirements

- Ruby
- Chrome browser installed
- [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver) gem
- Anthropic API key (for LLM access)

## Getting Started

1. Install dependencies: `bundle install`
2. Set your Anthropic API key in the environment.
3. Run the main script: `ruby main.rb`

## Extending

You can add more browser tools or modify the agent to support additional browser actions, scraping, or automation workflows.

