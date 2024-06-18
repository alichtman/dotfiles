return {
  "sontungexpt/url-open",
  event = "VeryLazy",
  cmd = "URLOpenUnderCursor",
  config = function()
    local status_ok, url_open = pcall(require, "url-open")
    if not status_ok then
      return
    end
    url_open.setup({
      open_app = "firefox",
      open_only_when_cursor_on_url = false,
    })
  end,
}
