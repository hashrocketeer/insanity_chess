def screenshot
  file = Tempfile.new(%w[capybara_screenshot .png])
  page.save_screenshot file.path, full: true
  `open #{file.path}`
end
