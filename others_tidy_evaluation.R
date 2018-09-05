library(tidyverse)

materialise <- function(data, ...) {
  dots <- list(...)
  dots
}
materialise(mtcars, 1 + 2, important_name = letters)

capture <- function(data, ...){
  dots <- enquos(...)
  dots
}

capture(mtcars, 1 + 2, import_name = letters)

forward <- function(data, ...){
  forwardee(...)
}

forwardee <- function(foo, bar, ...){
  list(foo = foo, bar = bar, ...)
}

forward(mtcars, bar = 100, 1, 2, 3)

grouped_mean <- function(data, summary_var, group_var){
  summary_var <- enquo(summary_var)
  group_var <- enquo(group_var)
  data %>% group_by(!!group_var)
  summarise(mean = mean(!!summary_var))
}

group_mean <- function(data, summary_var, ...){
  summary_var <- enquo(summary_var)
  data %>% group_by(...) %>% summarise(mean = mean(!!summary_var))
}

group_mean <- function(.data, .summary_var, ...){
  .summary_var <- enquo(.summary_var)
  .data %>% group_by(...) %>% summarize(mean = mean(!!.summary_var))
}

group_mean(mtcars, disp, cyl, am)

group_mean(mtcars, disp, cyl, am, vs)

grouped_mean2 <- function(data, summary_var, ...){
  summary_var <- enquo(summary_var)
  group_vars <- enquos(...)
  data %>% group_by(!!group_vars) %>% summarise(mean = mean(!!summary_var))
}

grouped_mean2 <- function(data, summary_var, ...) {
  summary_var <- enquo(summary_var)
  group_vars <- enquos(...)
  
  data %>%
    group_by(!!group_vars) %>%
    summarise(mean = mean(!!summary_var))
}

grouped_mean2(mtcars, disp, cyl, am)

grouped_mean2(mtcars, disp, cyl, am)

vars <- list(quote(cyl), quote(am))

rlang::qq_show(group_by(!!vars))
rlang::qq_show(group_by(!!!vars))

group_mean(mtcars, disp, cyl, am )
grouped_mean2(mtcars, disp, cyl, am )
