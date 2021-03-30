pacman::p_load(rio, tidyverse)

#A proposta da função é unir diversos data-sets que sejam extraídos em um monitoramento diário ou mensal

imp_neps <- function(termo){
  a <- list.files(str_c("Teste_tweets/", termo), recursive = T, full.names = T) %>% #O nome "Teste_tweets/" pode ser trocado para qualquer nome de pasta
    sapply(import, simplify = F) %>%
    bind_rows() %>%
    tibble() #A proposta é que se o comentador foi pego duas vezes, encontrar algum perfil que apareça duas vezes seguida com o mesmo tweet
  #Seja possível eliminar todas as duplicatas
  b <-  a[order(a[,'status_id'],-a[,'retweet_followers_count']),] #Pega apenas o mais recente número de followers
  t <-  b[!duplicated(a$status_id),]
  c <-  t[order(t[,'status_id'],-t[,'favourites_count']),] #Pega apenas o mais recente número de favorites
  d <-  c[!duplicated(c$status_id),]
  d %>% arrange(screen_name) #No final, unificar o data-set pronto
}
