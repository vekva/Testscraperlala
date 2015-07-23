diff --git a/scraper.rb b/scraper.rb
index 2d2baaa..f8b14d6 100644
--- a/scraper.rb
+++ b/scraper.rb
@@ -1,6 +1,8 @@
 require 'mechanize'
 require 'date'
-require 'json'
+require 'scraperwiki'
+
+ScraperWiki.config = { db: 'data.sqlite', default_table_name: 'data' }
 
 agent = Mechanize.new
 page = agent.get("http://pitchfork.com/reviews/albums/")
@@ -34,4 +36,6 @@ reviews = review_links.map do |link|
   }
 end
 
-puts JSON.pretty_generate(reviews)
+reviews.each do |review|
+  ScraperWiki.save_sqlite([:artist, :album], review)
+end
