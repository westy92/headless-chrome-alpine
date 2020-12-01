FROM alpine:edge

RUN apk --no-cache upgrade && apk add --no-cache chromium

EXPOSE 9222

ENTRYPOINT ["chromium-browser"]

CMD [ \
  ######################################
  # Flags for headless-chrome-alpine
  ######################################
  # Disable sandbox mode
  # TODO get this running without it
  "--no-sandbox", \
  # Run in headless mode
  "--headless", \
  # Hide scrollbars on generated images/PDFs
  "--hide-scrollbars", \
  # Expose port 9222 for remote debugging
  "--remote-debugging-port=9222", \
  ######################################
  # Flags from https://github.com/GoogleChrome/chrome-launcher/blob/master/src/flags.ts
  ######################################
  # Disable built-in Google Translate service
  "--disable-features=TranslateUI", \
  # Disable all chrome extensions
  "--disable-extensions", \
  # Disable some extensions that aren't affected by --disable-extensions
  "--disable-component-extensions-with-background-pages", \
  # Disable various background network services, including extension updating,
  #   safe browsing service, upgrade detector, translate, UMA
  "--disable-background-networking", \
  # Disable syncing to a Google account
  "--disable-sync", \
  # Disable reporting to UMA, but allows for collection
  "--metrics-recording-only", \
  # Disable installation of default apps on first run
  "--disable-default-apps", \
  # Mute any audio
  "--mute-audio", \
  # Disable the default browser check, do not prompt to set it as such
  "--no-default-browser-check", \
  # Skip first run wizards
  "--no-first-run", \
  # Disable backgrounding renders for occluded windows
  "--disable-backgrounding-occluded-windows", \
  # Disable renderer process backgrounding
  "--disable-renderer-backgrounding", \
  # Disable task throttling of timer tasks from background pages.
  "--disable-background-timer-throttling", \
  # Disable background tracing (aka slow reports & deep reports) to avoid 'Tracing already started'
  "--force-fieldtrials=*BackgroundTracing/default/" \
]
