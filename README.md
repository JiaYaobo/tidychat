
<!-- README.md is generated from README.Rmd. Please edit that file -->

# What’s TidyChat

Inspired by @jcrodriguez1989’s chatgpt package, a chatgpt library
directly chat with what you write!

## Installation

You can install the development version of {tidychat} from
[GitHub](https://github.com/jiayaobo/tidychat) with:

``` r
# install.packages("remotes")
remotes::install_github("jiayaobo/tidychat")
```

## Requirements

See what @jcrodriguez1989 describes in
[Requirements](https://github.com/jcrodriguez1989/chatgpt)

You can set your config with

``` r
set_tidychat(openai_api_key,
                         proxy_url = NULL,
                         proxy_port = NULL,
                         openai_model = "gpt-3.5-turbo",
                         openai_max_tokens = 256,
                         openai_temperature = 1,
                         openai_top_p = 1,
                         openai_frequency_penalty = 0,
                         openai_presence_penalty = 0,
                         openai_verbose = TRUE,
                         openai_return_language = "English")
```

## Features

- You can ask chatgpt for any questions with pure character string

- You can explore your data with tidychat

- You can get a report of summary without effort

- You can get the solution for your processing programming

- Integrate with %\>%

## Simply Ask GPT

**Sorry, I have no idea why generic functions for character is failed
for askgpt :(**

- Character

``` r
askgpt("Do you know Renmin University of China?") %>% cat
```

\*\*\* ChatGPT input:

\[1\] “Do you know Renmin University of China?” Yes, I am aware of
Renmin University of China. It is a well-known research university
located in Haidian District, Beijing, China.

- Function

``` r
find_prime <- function(x) {
  # find primary number
}

find_prime %>% askgpt("compelete the function to find primes between 1 to x") %>% cat
```

\*\*\* ChatGPT input:

compelete the function to find primes between 1 to x function(x) { \#
find primary number } Here’s the completed function to find all prime
numbers between 1 and x using the Sieve of Eratosthenes algorithm:

    find_primes <- function(x) {
      if (x < 2) {
        return(NULL)
      }
      
      primes <- rep(TRUE, x) # assume all numbers are prime initially
      
      primes[1] <- FALSE # 1 is not a prime number
      
      for (i in 2:sqrt(x)) {
        if (primes[i]) {
          primes[i^2:x:i] <- FALSE # cross out multiples of i
        }
      }
      
      return(which(primes))
    }

To use the function, simply call it with your desired upper limit, like
so:

    find_primes(20)

This will return a vector of all prime numbers between 1 and 20:

    [1]  2  3  5  7 11 13 17 19

- Sequence Functions

``` r
fseq <- .%>% filter(A>10) %>% mutate(B=A*10) %>% lm(A~B, data=.) %>% summary
fseq %>% askgpt("describe what the function do?") %>% cat
```

\*\*\* ChatGPT input:

describe what the function do? given the description below is a sequence
of functions piped with %\>%, assuming the operand is called data: 1.
filter(., A \> 10) 2. mutate(., B = A \* 10) 3. lm(A \~ B, data = .) 4.
summary(.) The sequence of functions is doing the following:

1.  Using the `filter()` function to filter out all the rows where the
    value in column A is less than or equal to 10. The resulting dataset
    will only include the rows where the value in column A is greater
    than 10.

2.  Using the `mutate()` function to create a new column called B, which
    is equal to the value in column A multiplied by 10. This new column
    will be added to the filtered dataset obtained from step 1.

3.  Using the `lm()` function to perform a linear regression of column A
    against column B in the dataset obtained from step 2.

4.  Using the `summary()` function to obtain a summary of the linear
    regression model obtained from step 3, which includes information
    such as the coefficients, standard errors, t-values, p-values, and
    R-squared value of the model.

- Data

``` r
data("mtcars")
mtcars %>% askgpt("give me some description on it") %>% cat
```

\*\*\* ChatGPT input:

give me some description on it ,given the data description below given
the data frame with 32 rows and 11 columns, and the column names are
mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear, carb , and the row
names are Mazda RX4, Mazda RX4 Wag, Datsun 710, Hornet 4 Drive, Hornet
Sportabout, Valiant, Duster 360, Merc 240D, Merc 230, Merc 280, Merc
280C, Merc 450SE, Merc 450SL, Merc 450SLC, Cadillac Fleetwood, Lincoln
Continental, Chrysler Imperial, Fiat 128, Honda Civic, Toyota Corolla,
Toyota Corona, Dodge Challenger, AMC Javelin, Camaro Z28, Pontiac
Firebird, Fiat X1-9, Porsche 914-2, Lotus Europa, Ford Pantera L,
Ferrari Dino, Maserati Bora, Volvo 142E , and the types of the columns
are numeric, numeric, numeric, numeric, numeric, numeric, numeric,
numeric, numeric, numeric, numeric The given data frame consists of 32
rows and 11 columns, where each row represents a particular car model
and each column represents a different attribute such as Miles per
gallon (mpg), Number of cylinders(cyl), Displacement(disp),
Horsepower(hp), Rear axle ratio(drat), Weight of the car(wt), Quarter
mile time(qsec), Engine type(vs), Transmission type(am), Number of
forward gears(gear), Number of carburetors(carb). All the columns are of
the numeric data type. The row names represent the different car models
in the dataset. These variables can be used to perform various
statistical analyses or build predictive models to understand the
relationships between different attributes of the car models.

- Or Data Related Summary

``` r
data("mtcars")
mtcars %>% lm(mpg~disp, data=.) %>% summary %>% askgpt("report the summay to me!") %>% cat
```

\*\*\* ChatGPT input:

report the summay to me!

Call: lm(formula = mpg \~ disp, data = .)

Residuals: Min 1Q Median 3Q Max -4.8922 -2.2022 -0.9631 1.6272 7.2305

Coefficients: Estimate Std. Error t value Pr(\>\|t\|)  
(Intercept) 29.599855 1.229720 24.070 \< 2e-16 *** disp -0.041215
0.004712 -8.747 9.38e-10 *** — Signif. codes: 0 ‘***’ 0.001 ’**’ 0.01
’*’ 0.05 ‘.’ 0.1 ’ ’ 1

Residual standard error: 3.251 on 30 degrees of freedom Multiple
R-squared: 0.7183, Adjusted R-squared: 0.709 F-statistic: 76.51 on 1 and
30 DF, p-value: 9.38e-10

This is a summary of a linear regression model. The model is predicting
miles per gallon (mpg) based on engine displacement (disp). The summary
shows the following:

- Residuals: These are the differences between the observed values and
  the predicted values. The summary reports the minimum, first quartile
  (1Q), median, third quartile (3Q), and maximum values for the
  residuals.
- Coefficients: These are the estimated regression coefficients for the
  intercept and engine displacement. The intercept is estimated to be
  29.6, indicating that when engine displacement is zero, the predicted
  mpg is 29.6. The coefficient for engine displacement is -0.04,
  indicating that as engine displacement increases by one unit, the
  predicted mpg decreases by 0.04 units. The standard error, t-value,
  and p-value are also reported for each coefficient.
- Residual standard error: This is the standard deviation of the
  residuals, which measures how far the observed values are from the
  predicted values.
- Multiple R-squared: This is a measure of how well the model fits the
  data, ranging from 0 to 1. In this case, the R-squared value is
  0.7183, indicating that 71.83% of the

## Guidance on Analysing Data

- For Data.Frame

``` r
data("mtcars")
mtcars %>% analyse("make regression between mpg and other variables") %>% cat
```

\*\*\* ChatGPT input:

Please analyse the data with idea: make regression between mpg and other
variables ,code block should be like `{r} code here` ,given the data
description below given the data frame with 32 rows and 11 columns, and
the column names are mpg, cyl, disp, hp, drat, wt, qsec, vs, am, gear,
carb , and the row names are Mazda RX4, Mazda RX4 Wag, Datsun 710,
Hornet 4 Drive, Hornet Sportabout, Valiant, Duster 360, Merc 240D, Merc
230, Merc 280, Merc 280C, Merc 450SE, Merc 450SL, Merc 450SLC, Cadillac
Fleetwood, Lincoln Continental, Chrysler Imperial, Fiat 128, Honda
Civic, Toyota Corolla, Toyota Corona, Dodge Challenger, AMC Javelin,
Camaro Z28, Pontiac Firebird, Fiat X1-9, Porsche 914-2, Lotus Europa,
Ford Pantera L, Ferrari Dino, Maserati Bora, Volvo 142E , and the types
of the columns are numeric, numeric, numeric, numeric, numeric, numeric,
numeric, numeric, numeric, numeric, numeric Sure, I can help you with
that. Here is the code block that performs linear regression between
“mpg” and all other variables in the given dataset:

``` {r}
# Read the data
data <- mtcars

# Build the regression model
model <- lm(mpg ~ ., data = data)

# Print the model summary
summary(model)
```

In this code block, we first load the mtcars dataset into R. Then, we
use the `lm()` function to build a linear regression model between “mpg”
and all other variables in the dataset. The dot `.` in the formula means
“all other variables”. Finally, we print the summary of the model using
the `summary()` function.

This should give you the regression results including the coefficients,
standard errors, p-values, etc.

- For Table

``` r
smoking <- c("yes", "no", "yes", "no", "yes", "no", "yes", "no", "yes", "no")
lung_cancer <- c("yes", "no", "yes", "no", "no", "no", "yes", "yes", "yes", "yes")

lung_data <- data.frame(smoking, lung_cancer)
lung_data$smoking_desc <- ifelse(lung_data$smoking == "yes", "Smoker", "Non-smoker")
lung_data$lung_cancer_desc <- ifelse(lung_data$lung_cancer == "yes", "Diagnosed with lung cancer", "No lung cancer")
cont_table <- table(lung_data$smoking_desc, lung_data$lung_cancer_desc)


cont_table %>% analyse("check if smoking and lung cancer are related") %>% cat
```

\*\*\* ChatGPT input:

Please analyse the data with idea: check if smoking and lung cancer are
related ,answer me start with and only return code like `{r} code here`
given the table with 2 rows and 2 columns, and the column names are
Diagnosed with lung cancer, No lung cancer , and the row names are
Non-smoker, Smoker , and the type of the value is integer Sure, here is
the code to check the relationship between smoking and lung cancer using
a chi-squared test:

``` {r}
# Create the data frame
mydata <- data.frame(
  "Smoker" = c(70, 230),
  "Non-smoker" = c(30, 370)
)

# Add column and row names
rownames(mydata) <- c("Non-smoker", "Smoker")
colnames(mydata) <- c("Diagnosed with lung cancer", "No lung cancer")

# Run the chi-squared test
chisq.test(mydata)
```

The output of this code will be the results of the chi-squared test,
including the test statistic, degrees of freedom, and p-value. This will
help you determine if there is a significant relationship between
smoking and lung cancer in this data.

## Create Reports With Format

- HTest

``` r
# create the contingency table
lung_cancer <- matrix(c(90, 10, 110, 40), ncol = 2, byrow = TRUE)
colnames(lung_cancer) <- c("Diagnosed with lung cancer", "No lung cancer")
rownames(lung_cancer) <- c("Non-smoker", "Smoker")

# perform the chi-squared test
chisq.test(lung_cancer) %>% create_report %>% cat
```

\*\*\* ChatGPT input:

Please create a markdown format report for this hypothesis test result
to me with statistical language

    Pearson's Chi-squared test with Yates' continuity correction

data: lung_cancer X-squared = 9.401, df = 1, p-value = 0.002169

# Hypothesis Test Report

We conducted a Pearson’s Chi-squared test with Yates’ continuity
correction to test the association between lung cancer and a potential
risk factor using the following statistical language:

- Null Hypothesis: There is no association between lung cancer and the
  potential risk factor.
- Alternative Hypothesis: There is an association between lung cancer
  and the potential risk factor.

We used the `lung_cancer` dataset for our analysis, which resulted in a
test statistic of X-squared = 9.401 with 1 degree of freedom. The
resulting p-value was 0.002169, which is less than the standard
significance level of 0.05.

Therefore, we reject the null hypothesis and conclude that there is a
significant association between lung cancer and the potential risk
factor.

In conclusion, the Pearson’s Chi-squared test result suggests that there
is a statistically significant association between the potential risk
factor and lung cancer.

- For Summary.\*

``` r
mtcars %>% lm(mpg~disp, data=.) %>% summary %>% create_report %>% cat
```

\*\*\* ChatGPT input:

Please create a markdown format report for this summary table to me with
statistical language

Call: lm(formula = mpg \~ disp, data = .)

Residuals: Min 1Q Median 3Q Max -4.8922 -2.2022 -0.9631 1.6272 7.2305

Coefficients: Estimate Std. Error t value Pr(\>\|t\|)  
(Intercept) 29.599855 1.229720 24.070 \< 2e-16 *** disp -0.041215
0.004712 -8.747 9.38e-10 *** — Signif. codes: 0 ‘***’ 0.001 ’**’ 0.01
’*’ 0.05 ‘.’ 0.1 ’ ’ 1

Residual standard error: 3.251 on 30 degrees of freedom Multiple
R-squared: 0.7183, Adjusted R-squared: 0.709 F-statistic: 76.51 on 1 and
30 DF, p-value: 9.38e-10

## Linear Regression Analysis Report

In this report, we present the results from a simple linear regression
analysis that aimed to assess the relationship between miles per gallon
(mpg) and the displacement of the engine (disp) of a car. We ran a
linear regression model using the lm() function of R, with mpg as the
dependent variable and disp as the independent variable.

The analysis was based on a sample of 32 observations, and the model had
good overall statistical significance (F-statistic = 76.51, p-value =
9.38e-10).

The results showed that the displacement of the engine (disp) was
significantly negatively related to the miles per gallon (mpg) of the
car (estimate = -0.041215, t-value = -8.747, p-value \< 0.001). Thus, on
average, the miles per gallon (mpg) of a car decreased by 0.04 units for
each unit of increase in the displacement of the engine (disp).

The model had a good fit to the data, explaining 71.83% of the variance
in the miles per gallon (mpg) variable (R-squared = 0.7183), and the
adjusted R-squared value was

## Code Completion

``` r
f <- function(x, y) {
  # merge two sorted list x and y
}
f %>% code_completion(idea=NULL) %>% cat
```

\*\*\* ChatGPT input:

Please complete the code and answer me start with and only return code
like `{r} code here` function(x, y) { \# merge two sorted list x and y }

``` {r}
merge_sorted_lists <- function(x, y) {
  # initialize variables
  i <- 1
  j <- 1
  merged <- c()
  
  # loop through both lists until one is fully merged
  while (i <= length(x) & j <= length(y)) {
    # compare elements of both lists and add smaller element to merged list
    if (x[i] < y[j]) {
      merged <- c(merged, x[i])
      i <- i + 1
    } else {
      merged <- c(merged, y[j])
      j <- j + 1
    }
  }
  
  # add remaining elements of the partially merged list
  if (i <= length(x)) {
    merged <- c(merged, x[i:length(x)])
  }
  if (j <= length(y)) {
    merged <- c(merged, y[j:length(y)])
  }
  
  # return merged list
  return(merged)
}
```

## Code Comment

``` r
fibo <- function(n){
  if (n == 1 || n == 0 || n == 2){
    return(n)
  }else {
    return(fibo(n-1) + fibo(n-2))
  }
}
fibo %>% code_comment %>% cat
```

\*\*\* ChatGPT input:

Please comment the code below , and instantly return code like
`{r} code and comment here` function(n){ if (n == 1 \|\| n == 0 \|\| n
== 2){ return(n) }else { return(fibo(n-1) + fibo(n-2)) } }

``` {r}
# The following function calculates the nth number in the Fibonacci sequence recursively
# The if statement checks if the input n is either 0, 1 or 2 because the sequence starts with 0, 1, 1
# If n is not 0, 1 or 2, the function calculates the nth number by adding the previous 2 numbers in the sequence
function(n){
  if (n == 1 || n == 0 || n == 2){
    return(n)
  }else {
    return(fibo(n-1) + fibo(n-2))
  }
}
```

## Others

### Disable Console Messages

If you want {tidychat} not to show messages in console,just like
{chatgpt}, set the environment variable `OPENAI_VERBOSE=FALSE`.

### Change the language of ChatGPT responses

Change the `OPENAI_RETURN_LANGUAGE` with \``Sys.setenv`

``` r
Sys.setenv("OPENAI_RETURN_LANGUAGE" = "中文")
# check if modified
get_tidychat()
```

\$openai_api_key \[1\]
“*”

\$openai_model \[1\] “gpt-3.5-turbo”

\$openai_max_tokens \[1\] “256”

\$openai_temperature \[1\] “1”

\$openai_top_p \[1\] “1”

\$openai_frequency_penalty \[1\] “0”

\$openai_presence_penalty \[1\] “0”

\$openai_verbose \[1\] “TRUE”

\$openai_return_language \[1\] “中文”

``` r
mtcars %>% lm(mpg~disp, data=.) %>% summary %>% create_report %>% cat
```

\*\*\* ChatGPT input:

Please create a markdown format report for this summary table to me with
statistical language

Call: lm(formula = mpg \~ disp, data = .)

Residuals: Min 1Q Median 3Q Max -4.8922 -2.2022 -0.9631 1.6272 7.2305

Coefficients: Estimate Std. Error t value Pr(\>\|t\|)  
(Intercept) 29.599855 1.229720 24.070 \< 2e-16 *** disp -0.041215
0.004712 -8.747 9.38e-10 *** — Signif. codes: 0 ‘***’ 0.001 ’**’ 0.01
’*’ 0.05 ‘.’ 0.1 ’ ’ 1

Residual standard error: 3.251 on 30 degrees of freedom Multiple
R-squared: 0.7183, Adjusted R-squared: 0.709 F-statistic: 76.51 on 1 and
30 DF, p-value: 9.38e-10

# 线性回归分析报告

本文介绍了一次针对汽车油耗（mpg）与排量（disp）之间的线性回归分析。

研究发现，汽车的油耗与其排量呈负相关关系，即排量越大，油耗越低。通过对数据进行线性回归分析，得到的回归方程如下所示：mpg
= 29.599855 - 0.041215 \* disp。

该方程的截距项为29.599855，表示当排量为0时，汽车的油耗为29.599855。斜率项为-0.041215，表示每增加1单位的排量，油耗平均下降0.041215单位。

通过对该回归方程的统计检验，发现拟合效果良好，并且得出了显著性检验的结果。多重R平方为

### References

[chatgpt](https://github.com/jcrodriguez1989/chatgpt)
