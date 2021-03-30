pacman::p_load(rio, tidyverse)

imp_neps <- function(termo){
  a <- list.files(str_c("Teste_tweets/", termo), recursive = T, full.names = T) %>%
    sapply(import, simplify = F) %>%
    bind_rows() %>%
    tibble()
  b <-  a[order(a[,'status_id'],-a[,'retweet_followers_count']),]
  t <-  b[!duplicated(a$status_id),]
  c <-  t[order(t[,'status_id'],-t[,'favourites_count']),]
  d <-  c[!duplicated(c$status_id),]
  d %>% arrange(screen_name)
}
