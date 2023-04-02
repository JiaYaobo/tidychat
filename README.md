
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

\*\*\* ChatGPT input:

\[1\] “Do you know Renmin University of China?” Yes, I am familiar with
Renmin University of China. It is a top-ranked university located in
Beijing, China known for its strong focus on social sciences and
humanities education.

- Function

\*\*\* ChatGPT input:

compelete the function to find primes between 1 to x function(x) { \#
find primary number } Here’s the completed function to find prime
numbers between 1 and x:

    find_primes <- function(x) {
      
      primes <- c()
      
      # Loop through possible prime numbers
      for (i in 2:x) {
        
        # Assume i is a prime number
        is_prime <- TRUE
        
        # Check if i is divisible by any number from 2 up to (i - 1)
        for (j in 2:(i-1)) {
          if (i%%j == 0) {
            is_prime <- FALSE # i is not a prime number
            break # exit the inner loop
          }
        }
        
        # If i is a prime number, add it to the primes vector
        if (is_prime) {
          primes <- c(primes, i)
        }
        
      }
      
      return(primes)
      
    }

The function works by looping through every number between 2 and x. For
each number, it checks if it’s divisible by any number from 2 up to (i -
1). If i is not divisible by any of those numbers, then it is considered
a prime number and is added to the `primes` vector. Finally, the
function returns

- Sequence Functions

\*\*\* ChatGPT input:

describe what the function do? given the description below is a sequence
of functions piped with %\>%, assuming the operand is called data: 1.
filter(., A \> 10) 2. mutate(., B = A \* 10) 3. lm(A \~ B, data = .) 4.
summary(.) The sequence of functions piped with `%>%` performs the
following tasks using the dataset named “data”:

1.  `filter(., A > 10)` filters the data to select only those rows where
    the value in column “A” is greater than 10.
2.  `mutate(., B = A * 10)` creates a new column “B” by multiplying the
    values in column “A” by 10.
3.  `lm(A ~ B, data = .)` performs a linear regression analysis, where
    “A” is the dependent variable and “B” is the independent variable.
4.  `summary(.)` generates a summary of the linear regression analysis
    performed in step 3, and outputs information such as R-squared,
    coefficients, standard errors, and p-values. The `.` refers to the
    resulting object from the previous function call (i.e., the linear
    regression model in this case).

- Data

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
numeric, numeric, numeric, numeric This dataset contains information on
32 different cars including their miles per gallon (mpg), number of
cylinders (cyl), displacement (disp), horsepower (hp), rear axle ratio
(drat), weight in thousands of pounds (wt), 1/4 mile time (qsec), engine
shape (vs), transmission type (am), number of forward gears (gear), and
number of carburetors (carb). The data is numerical and is indexed by
the name of each car. This dataset can be used for statistical analyses
and modeling related to car performance and specifications.

- Or Data Related Summary

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

This is a summary of a linear regression model in R. The model is used
to predict the miles per gallon (mpg) based on the displacement (disp)
of the vehicle.

The intercept (29.599855) is the predicted mpg when the displacement is
zero. The coefficient of disp (-0.041215) tells us that for each one
unit increase in the displacement, the mpg decreases by 0.041215 units.

The p-values for the intercept and the coefficient of disp are both very
small (\< 0.001), indicating that they are both statistically
significant predictors of mpg.

The multiple R-squared value (0.7183) tells us that approximately 72% of
the variability in the mpg can be explained by the displacement of the
vehicle.

The residual standard error (3.251) is an estimate of the standard
deviation of the residuals, or the difference between the predicted and
actual values of mpg.

The adjusted R-squared value (0.709) takes into account the number of
predictors in the model and is a better measure of the model’s ability
to predict the mpg.

The F-statistic (76.51) is used to test the overall significance of the
model and has a very small p-value (\<

## Guidance on Analysing Data

- For Data.Frame

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
numeric, numeric, numeric, numeric, numeric Sure, below is the code
block that will perform linear regression between mpg and all other
variables in the given data frame:

``` {r}
# Load the data frame
data <- mtcars

# Fit a linear regression model for mpg against all other variables
model <- lm(mpg ~ ., data)

# Print the summary of the model
summary(model)
```

Explanation of the above code: - We first load the data frame using the
`mtcars` dataset available in R. - We then fit a linear regression model
between the response variable `mpg` and all the predictor variables
using the `lm()` function in R. - Finally, we print the summary of the
model using the `summary()` function in R. The summary provides
information about the coefficients of the model, their standard errors,
t-values, p-values, and R-squared value. This information can be used to
evaluate the significance of each predictor variable in the model. \*
For Table

\*\*\* ChatGPT input:

Please analyse the data with idea: check if smoking and lung cancer are
related ,answer me start with and only return code like `{r} code here`
given the table with 2 rows and 2 columns, and the column names are
Diagnosed with lung cancer, No lung cancer , and the row names are
Non-smoker, Smoker , and the type of the value is integer Sure, here’s
the code to perform a chi-squared test of independence in R to determine
if smoking and lung cancer are related:

``` {r}
# create the contingency table 
lung_cancer <- matrix(c(10, 50, 5, 35), nrow = 2, ncol = 2, byrow = T, 
                      dimnames = list(c("Non-smoker", "Smoker"), 
                                      c("Diagnosed with lung cancer", "No lung cancer")))

# perform the chi-squared test of independence 
chisq.test(lung_cancer)
```

The output will include the test statistic, degrees of freedom, p-value,
and expected cell counts. The p-value will tell us if there is a
significant association between smoking and lung cancer. \## Create
Reports With Format

- HTest

``` r
# create the contingency table
lung_cancer <- matrix(c(90, 10, 110, 40), ncol = 2, byrow = TRUE)
colnames(lung_cancer) <- c("Diagnosed with lung cancer", "No lung cancer")
rownames(lung_cancer) <- c("Non-smoker", "Smoker")

# perform the chi-squared test
chisq.test(lung_cancer) %>% create_report %>% cat
#> 
#> *** ChatGPT input:
#> 
#> Please create a  markdown  format report for this hypothesis test result to me with statistical language
#> 
#>  Pearson's Chi-squared test with Yates' continuity correction
#> 
#> data:  lung_cancer
#> X-squared = 9.401, df = 1, p-value = 0.002169
#> 
#> # Hypothesis Test Report
#> 
#> ## Test Methodology
#> We conducted Pearson's Chi-squared test with Yates' continuity correction to test the following hypothesis:
#> 
#> * Null Hypothesis (H0): There is no significant association between lung cancer and the risk factor.
#> * Alternative Hypothesis (HA): There is a significant association between lung cancer and the risk factor.
#> 
#> ## Test Results
#> Based on the data we collected and the Pearson's Chi-squared test results with Yates' continuity correction, we found that the test statistic (X-squared) is 9.401 with 1 degree of freedom. The p-value for the test is 0.002169.
#> 
#> ## Conclusion
#> Since the p-value is less than the significance level of 0.05, we reject the null hypothesis. Thus, there is a significant association between lung cancer and the risk factor under consideration.
```

- For Summary.\*

``` r
mtcars %>% lm(mpg~disp, data=.) %>% summary %>% create_report %>% cat
#> 
#> *** ChatGPT input:
#> 
#> Please create a  markdown  format report for this summary table to me with statistical language
#> 
#> Call:
#> lm(formula = mpg ~ disp, data = .)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -4.8922 -2.2022 -0.9631  1.6272  7.2305 
#> 
#> Coefficients:
#>              Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 29.599855   1.229720  24.070  < 2e-16 ***
#> disp        -0.041215   0.004712  -8.747 9.38e-10 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 3.251 on 30 degrees of freedom
#> Multiple R-squared:  0.7183, Adjusted R-squared:  0.709 
#> F-statistic: 76.51 on 1 and 30 DF,  p-value: 9.38e-10
#> 
#> Summary Table:
#> 
#> A linear regression model was fitted to predict miles per gallon (mpg) from engine displacement (disp). The model summary is presented below.
#>  
#> Model: mpg = 29.599855 - 0.041215*disp
#> 
#> The intercept term of the model is significant at a level of 0.05 since the p-value is less than 0.05. The same applies to the coefficient estimate of disp which has a significant negative relationship with mpg at the 0.001 level since its corresponding p-value is less than 0.001. For every unit increase in engine displacement size, the model predicted a decrease of 0.04 miles per gallon, on average. 
#> 
#> The multiple R-squared of the fitted model is 0.7183, which indicates that engine displacement explains about 71.8% of the variation in miles per gallon. The adjusted R-squared value of 0.709 implies that the model fits the data reasonably well. 
#> 
#> The F-statistic value of 76.51 on 1 and 30 degrees of freedom test whether the coefficient estimate of displacement is significantly different from zero. The corresponding p-value of 9.38e-10 confirms that the model is statistically significant at the 0.
```

## Code Completion

``` r
f <- function(x, y) {
  # merge two sorted list x and y
}
f %>% code_completion(idea=NULL) %>% cat
#> 
#> *** ChatGPT input:
#> 
#> Please complete the code and answer me start with and only return code like ```{r} code here```
#> function(x, y) {
#>   # merge two sorted list x and y
#> }
#> ```{r}
#> merge_sorted_lists <- function(x, y) {
#>   result <- vector(length = length(x) + length(y))
#>   i <- 1
#>   j <- 1
#>   k <- 1
#>   
#>   while (i <= length(x) && j <= length(y)) {
#>     if (x[i] < y[j]) {
#>       result[k] <- x[i]
#>       i <- i + 1
#>     } else {
#>       result[k] <- y[j]
#>       j <- j + 1
#>     }
#>     k <- k + 1
#>   }
#>   
#>   while (i <= length(x)) {
#>     result[k] <- x[i]
#>     i <- i + 1
#>     k <- k + 1
#>   }
#> 
#>   while (j <= length(y)) {
#>     result[k] <- y[j]
#>     j <- j + 1
#>     k <- k + 1
#>   }
#>   
#>   return(result)
#> }
#> ``` 
#> 
#> This is a function that merges two sorted lists, x and y. It creates a new empty vector, `result`, of length equal to the sum of the length of x and y. It then iterates through both lists simultaneously, inserting each element in `result` in the order of
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
#> 
#> *** ChatGPT input:
#> 
#> Please comment the code below , and instantly return code like ```{r} code and comment here``` 
#> function(n){
#>   if (n == 1 || n == 0 || n == 2){
#>     return(n)
#>   }else {
#>     return(fibo(n-1) + fibo(n-2))
#>   }
#> }
#> ```{r}
#> # The code above presents a recursive function called 'fibo',
#> # which takes an integer 'n' as input.
#> # If 'n' is equal to 0, 1, or 2, the function returns 'n'.
#> # If 'n' is greater than 2, the function returns the sum of 
#> # the previous two numbers in the Fibonacci sequence through recursion.
#> # However, this code has not been defined and initialized. 
#> # Thus, it will throw an error if executed without an initial call or function definition.
#> ```
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
#> $openai_api_key
#> [1] "*"
#> 
#> $openai_model
#> [1] "gpt-3.5-turbo"
#> 
#> $openai_max_tokens
#> [1] "256"
#> 
#> $openai_temperature
#> [1] "1"
#> 
#> $openai_top_p
#> [1] "1"
#> 
#> $openai_frequency_penalty
#> [1] "0"
#> 
#> $openai_presence_penalty
#> [1] "0"
#> 
#> $openai_verbose
#> [1] "TRUE"
#> 
#> $openai_return_language
#> [1] "中文"
```

``` r
mtcars %>% lm(mpg~disp, data=.) %>% summary %>% create_report %>% cat
#> 
#> *** ChatGPT input:
#> 
#> Please create a  markdown  format report for this summary table to me with statistical language
#> 
#> Call:
#> lm(formula = mpg ~ disp, data = .)
#> 
#> Residuals:
#>     Min      1Q  Median      3Q     Max 
#> -4.8922 -2.2022 -0.9631  1.6272  7.2305 
#> 
#> Coefficients:
#>              Estimate Std. Error t value Pr(>|t|)    
#> (Intercept) 29.599855   1.229720  24.070  < 2e-16 ***
#> disp        -0.041215   0.004712  -8.747 9.38e-10 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#> 
#> Residual standard error: 3.251 on 30 degrees of freedom
#> Multiple R-squared:  0.7183, Adjusted R-squared:  0.709 
#> F-statistic: 76.51 on 1 and 30 DF,  p-value: 9.38e-10
#> 
#> 这是一个线性回归模型，建立了汽车油耗（mpg）与排量（disp）之间的关系。通过模型得到可以得出两个系数，截距（Intercept）和系数（disp）。拟合的模型为 mpg = 29.5998 - 0.0412 * disp。这个模型有良好的拟合效果，因为$R^2$等于0.7183，表明模型可以用来解释71.83%的数据方差。同时，调整的 R-squared 值为 0.709，这意味着模型的拟合效果有一定的限制。残差标准误为3.251，代表模型的平均预测误差为3.251。从t-tests中可以看出，disp的p值小于0.05，表明disp对mpg的影响是显着的。结果显示disp和mpg之间呈现出负相关的
```

### References

[chatgpt](https://github.com/jcrodriguez1989/chatgpt)
