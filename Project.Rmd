---
title: "STAT253 – Homework#<1>"
author: "Ufuk GURBUZ  - <150113058>"
date: "8 Mayis 2016"
output: word_document
---

## <<< PROJECT EXPLAIN >>>

Does the price of an appliance convey something about its quality? Forty-eight different
dishwashers were ranked on characteristics ranging from an overall satisfaction score,
washing (x1), energy use (x2), noise (x3), ease of use (x4), and cycle time (in minutes). The Bosch
(SHE55M1[2]UC) had the highest performance score of 82 while the GE (GLD4408R[WW]) had
the lowest at 53. Ratings pictograms were converted to numerical values for x1, …, x4, where
5 = Excellent, 4 = Very good, 3 = Good, 2 = Fair, and 1 = Poor. Use a statistical computer
package to explore the relationships between various pairs of variables in the table.

## <<< DATA TABLE >>>
 
 
 
```{r datas}

load("C:/Users/_SeriousBoy_/Desktop/Statistic Project 1/dishwashers.csv")
print(dishwashers)

```

## < - - QUESTION 1 - - >

Look at the variables Price, Score, and Cycle Time individually. What can you say about symmetry? About outliers?

## ~  The Five-Number Summary ~

- Let us find five-number summary of price datas.
```{r five-number price}
summary(dishwashers$Price)
```

- Let us find five-number summary of score datas.
```{r five-number score}
summary(dishwashers$Score)
```

- Let us find five-number summary of cycle time datas.
```{r five-number cycle time}
summary(dishwashers$Cycle_time)
```

  *** I examined "median" and "mean" of above data sets. The "median" and "mean" should be same for being symmetry. But; when i looked above data sets, i saw that nothing is same. So, there isn't symmetry for above data sets.

## ~  The Box Plots of Price, Score, Cycle Time ~

- Let us create box plot of price datas.
```{r price boxPlot}
boxplot(dishwashers$Price, main="Box Plot of Price", width=250, xlab="Models", ylab="Prices($)", col="red", outline = TRUE)
```

- Let us create box plot of score datas.
```{r score boxPlot}
boxplot(dishwashers$Score, main="Box Plot of Score", width=250, xlab="Models", ylab="Scores", col="blue", outline = TRUE)
```

- Let us create box plot of cycle time datas.
```{r cycle boxPlot}
boxplot(dishwashers$Cycle_time,main="Box Plot of Ciycle Time",width=250,xlab="Models",ylab="Cycle Times", col="green", outline = TRUE)
```


  *** I examined "boxplots" of above data sets. There is no outlier in "boxplots" of 'price' and 'score' data sets. But, the "boxplot" of cycle time has a outlier.
  
## < - - QUESTION 2 - - >

Look at all the variables in pairs. Which pairs are positively correlated? Negatively
correlated? Are there any pairs that exhibit little or no correlation? Are some of these results
counterintuitive?

```{r correlation matrix}
install.packages("corrplot")   # --> installing package for running correlation plot
price <- dishwashers$Price
score <- dishwashers$Score
x1 <- dishwashers$x1
x2 <- dishwashers$x2
x3 <- dishwashers$x3
x4 <- dishwashers$x4
cycleTime <- dishwashers$Cycle_time

data <- data.frame(price, score, x1, x2, x3, x4, cycleTime)
#head.matrix(data,48)

M <- cor(data)
round(M, 2)
```

## ~ The Correlation Coefficient Plot ~

- Let us create correlation coefficient plot for all data sets.

```{r corrPlot}
library(corrplot)
corrplot(M, method="number")
```


***  I examined "values" on above data table as pairs. The correlation coefficient always is between '0' and '1' as theoretical and I saw it. There isn't 'negative' relationship between above variable pairs. But, there are 'positive'(numbers) and 'no'(NA-?) relationship. The number which has dark color shows "strong" relationship. Otherwise, the number shows "weak" relationship. There is some counterintuitive results. Example; there isn't anything logical correlation for "x1" variable or between price-score, score-x2, score-cycleTime, x3-x4, x4-cycleTime. Namely; although the score of appliance is low, the price of same appliance can be high. This is counterintuitive result. In addition to these, "x1" has correlation only with itself. Also, every variable have correlation coefficient number which is "1" with themselves.

## < - - QUESTION 3 - - >

Does the price of an appliance, specifically a dishwasher, convey something about its
quality? Which variables did you use in arriving at your answer?

***  The price of an appliance(dishwasher) doesn't convey information about its quality. Because, you can't make a generalization only by examining the price. You should examine necessary variable which determines price. Why is high the price, what is the cases which determine price or is it effect of brand ?
I used many variables in arriving at my answer. These variables are "overall satisfaction score", "washing (x1)", "energy use (x2)", "noise (x3)", "ease of use (x4)", and "cycle time. If the score and ease of use is high, the washing is quality, the energy usage, noise and cycle time is low; the appliance is so good. This quality determines price of appliance. But; if the price of a appliance is high, it isn't mean that the appliance is better than. Sometimes, we can pay money only 'brand name' of appliance. So, we should evaluate above variables and then, we should decide which we buy appliance.
