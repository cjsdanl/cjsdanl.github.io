# Data Assembly
  # rbind() can row-bind data.frames
  # cbind () can column-bing data.frames
df1 <- data.frame(id = 1:3, 
                  name = c("Alice", "Bob", "Charlie")
)
df2 <- data.frame(id = 4:6, 
                  name = c("Dave", "Eve", "Frank")
)
df_rbind <- rbind(df1, df2)
df_cbind <- cbind(df1, df2) # better to rename id before cbind()
  # rbind() does not work if the two data.frames have different names of columns
  # cbind() does not work if the two data.frames have different names of rows
  # if you put a pipe function in it is the same thing (it takes the data frame at the first argument)

# Relational Data
  # it's rare that a data analysis involves only a single data frame
  # collectively, multiple data frames are called relational data
  # to work with relational data, we need verbs that work with pairs of data frames
    # join mehtods add new variables to one data frame from matching observations in another data frame

# Ex.
install.packages("nycflights13")
library(nycflights13)
flights # flights connect to ...
planes # planes via a single variable, tailnum
airlines # airlines through the carrier variable
airports # airports in two ways: via the origin and dest variables
weather # weather via origin (the location), and year, month, day and hour (the time)

  # key variables
    # a key variable (or a set of key variables) is a variable (or a set of variables) that
    # uniquely indentifies an observation
      # so, a key variable is used to connect relational data.frames
      # the name of a key variable can be different across relational data.frames
  # a join allows us to combine two data frames via key variables
    # it first matches observations by their keys, then copies across variables from one data.frame to the other
  # we will use only the left joing
    # keeps all the obervations from the left
# Ex.
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3" )
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3" )
join_left <- x %>% 
  left_join(y)
  # a left join keeps all observations in x data.frame
  # the most commonly used join is the left join
join_left <- x %>% 
  left_join(y)

# joins
  # defining the key columns
    # by = "a": uses only variable a
    # by = c("a" = "b"): match variable a in data frame x to variable b in data frame y
# Ex.
flights2 %>% 
  left_join(weather)
flights2 %>% 
  left_join(planes, 
            by = "tailnum")
flights2 %>% 
  left_join(airports, 
            c("dest" = "faa"))
flights2 %>% 
  left_join(airports, 
            c("origin" = "faa"))