# llm_agent_webbrowser

This project is a demonstration of an LLM-controlled browser agent. It allows a large language model (LLM) to interact with and control a Chrome web browser in real time, using natural language.

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

