# Podcast Server

Podcast downloader, feed generator and server, dockerised.

## Install

Copy docker-compose.yml to the server and execute `docker-compose up -d`.

### Environment variables

| Variable | Function |
| ---------| -------- |
| BASE_URL | Full URL (e.g. http://podcasts.example.com) pointing to the web root where the feed and media files are served from |
| PODCAST_TITLE | Title of the show or podcast feed |
| PODCAST_DESCRIPTION | A description of the show or podcast feed |
| PODCAST_LINK | URL to the show |
| PODCAST_IMAGE | Album art for the show or podcast feed |
| PODCAST_UPDATE_INTERVAL | Interval between feed refreshes |

## Usage

### Files

- MP3 files are saved to /config/www/static.
- The podcast feed is saved as an XML file at $BASE_URL/index.xml.
- Brief instructions are available in HTML at $BASE_URL.

### Media sources

Specify the media sources as a list of URLs in the config/urls.txt file (one URL per line). Any URL supported by yt-dlp should work. This the config/urls.txt file does not already exist, the application will create it.
