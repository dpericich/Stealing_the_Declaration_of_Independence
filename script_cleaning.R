## File to get and clean National Treasure Scripts
library(rvest)
library(dplyr)
library(tidytext)
library(stringr)

url = "http://www.script-o-rama.com/movie_scripts/n/national-treasure-script-transcript.html"
page = read_html(url)

script_text = page %>% html_node("pre") %>% html_text()
script_text = str_replace_all(script_text, "\n", "")
script_text = str_replace_all(script_text, '\"', "")

script_text_df <- tibble(text=script_text)

script_text_broken = script_text_df %>% unnest_tokens(word, text)

write.csv(script_text_broken, file="natltreasure.csv")