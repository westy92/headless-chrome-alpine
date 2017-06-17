FROM alpine:edge

RUN apk add --no-cache chromium

EXPOSE 9222

ENTRYPOINT ["chromium"]

# flags from https://github.com/GoogleChrome/lighthouse/blob/master/chrome-launcher/flags.ts
CMD [ \
  # Disable various background network services, including extension updating,
  #   safe browsing service, upgrade detector, translate, UMA
  "--disable-background-networking", \
  # Disable installation of default apps on first run
  "--disable-default-apps", \
  # Disable all chrome extensions entirely
  "--disable-extensions", \
  "--disable-gpu", \
  # Disable syncing to a Google account
  "--disable-sync", \
  # Disable built-in Google Translate service
  "--disable-translate", \
  "--headless", \
  # Disable reporting to UMA, but allows for collection
  "--metrics-recording-only", \
  # Skip first run wizards
  "--no-first-run", \
  "--remote-debugging-port=9222", \
  # Disable fetching safebrowsing lists, likely redundant due to disable-background-networking
  "--safebrowsing-disable-auto-update", \
]