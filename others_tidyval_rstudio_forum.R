library(dplyr)
wtf <- function(df = mtcars, test = stupid){
    test<- enexpr(test) 
   df %>% mutate(!! test := mpg) %>% mutate(!!test := (!!test) + 1)
}

head(wtf())

wtf2 <-function(df = mtcars, test = 'stupid'){
  df %>% mutate(!! test := mpg) %>% mutate(!!test := (!!as.name(test)) + 1)
} 

wtf()
head(wtf2())
wtf3 <- function(df = mtcars, test = 'stupid'){
  test<- enexpr(test) 
  df %>% mutate(!! test := mpg) %>% mutate(!!test := !!sym(test) + 1)
}