pacman::p_load(rtweet, tidyverse) #jeito mais prático de abrir os pacotes, sem precisar repetir "library"


tweets_download <- function(query, retryonratelimit = TRUE, include_rts = FALSE, filter = "replies", lang = "pt"){ #Nome da função, em geral vai buscar como você quer, se quisero mudar algo é só escrever na função
  tw <- search_tweets(q = query, #fazer o search com esses parâmetros
                      retryonratelimit = retryonratelimit,
                      include_rts = include_rts,
                      `-filter` = filter,
                      lang = lang) #repara que o jeito que eu escrevi faz com que caso você queira mudar algo na função ele mude aqui
  if(nrow(tw) > 1000000){ #Se o número de linhas for maior que 1000000
    t1 <- tw %>% slice(1:1000000)
    t2 <- tw %>% slice(1000000:nrow(tw)) #Divide em dois csv
      b_query <- str_replace_all(query, "\"", "")
      name1 <- str_c(format(Sys.time(), "%y_%m_%d_%H_%M_%S"), "_tweet_download", "_", word(b_query, 1L), "_1", ".csv")
      name2 <- str_c(format(Sys.time(), "%y_%m_%d_%H_%M_%S"), "_tweet_download", "_", word(b_query, 1L), "_2", ".csv")}
      else { #Caso não tenha 1000000 de linhas fazemos esse percurso
        b_query <- str_replace_all(query, "\"", "")
        name <- str_c(format(Sys.time(), "%y_%m_%d_%H_%M_%S"), "_tweet_download", "_", word(b_query, 1L), ".csv") #Criar o nome para exportação
        write_as_csv(tw, file_name = name)}}