
# Análise de dados com NAs ----------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco --------------------------------------------------------------------------
# Data: 08/09/2022 ------------------------------------------------------------------------------------------

# Carregar pacotes necessários -------------------------------------------------------------------------------------------------------------

library(tidyverse)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

dados <- starwars
view(dados)

# Funções que removem NAs ------------------------------------------------------------------------------------------------------------------

drop_na() # Pacote tidyr
na.rm = T # Usado após as funções de cálculos

# Análises ---------------------------------------------------------------------------------------------------------------------------------

# Quantidade de NAs em cada variável do data frame:

library(plyr)
quantos.na <- colwise(function(x) sum(is.na(x)))
quantos.na(dados)

#####################################################

d <- dados %>%
  select(name, height, mass, hair_color) %>%
  view()
tibble(d) # 87 linhas e 4 colunas
 
dh <- dados %>%
  select(name, height, mass, hair_color) %>%
  drop_na(height) %>% # Retira apenas os NAs da variável altura (6 NAs)
  view()

dm <- dados %>%
  select(name, height, mass, hair_color) %>%
  drop_na(mass) %>% # Retira apenas os NAs da variável massa (28 NAs)
  view()

dhc <- dados %>%
  select(name, height, mass, hair_color) %>%
  drop_na(hair_color) %>% # Retira apenas os NAs da variável cor do cabelo (5 NAs)
  view()

# Caso queira analisar todas as variáveis selecionadas em conjunto, pode-se 
# retirar todos os NAs.

dna <- dados %>%
  select(name, height, mass, hair_color) %>%
  drop_na() %>% # Retira todos os NAs
  view()
