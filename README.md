# EDA of Dineout Using MySQL

This repository contains an Exploratory Data Analysis (EDA) project on Dineout data, performed using MySQL & visualized using Power BI.

## Table of Contents

- [Project Description](#project-description)
- [Installation](#installation)
- [Usage](#usage)
- [Data Source](#data-source)
- [Technologies Used](#technologies-used)
- [Exploratory Questions](#exploratory-questions)
- [Dashboard](#dashboard)
- [Insights](#insights)
- [License](#license)

## Project Description

Dineout is a table booking platform helping customers to do table booking in their favourite restaurants for free and help them get great discounts.

The website is well known for displaying user ratings for restaurants, hotels, b&b, touristic attractions, and other places, with a total word count of all reviews is more than 10 million.

In this project I have performed Exploratory Data Analysis (EDA) on Dineout data using MySQL. The analysis includes data exploration, data cleaning, data visualization, and deriving insights from the data.

The main goal of this project is to explore the Dineout dataset and gain meaningful insights into the dining preferences, trends, and patterns.

## Installation

To run the code in this repository, you need to have the following installed:

- MySQL: [Download](https://www.mysql.com/downloads/)
- MySQL Workbench: [Download](https://www.mysql.com/products/workbench/)

Clone the repository to your local machine using the following command:

git clone https://github.com/Rupanavale/EDA-of-Dineout-Using-MySQL.git


## Usage

1. Open MySQL Workbench.
2. Import the dataset into your MySQL database.
3. Open the SQL scripts provided in the repository and execute them in MySQL Workbench.
4. Follow the comments in the scripts to understand the steps performed for EDA.
5. Explore the results, visualizations, and insights derived from the analysis.

## Data Source

The dataset used in this project is sourced from [https://www.kaggle.com/datasets/arnabchaki/indian-restaurants-2023]. The Dineout dataset includes thousands of restaurants with attributes such as location data, average rating, number of reviews, cuisine types, etc.

The dataset combines the restaurants from the main Indian cities.

## Technologies Used

- MySQL
- MySQL Workbench
- Power BI

## Exploratory Questions
1. Which city has the highest number of restaurants?
2. What are the top 3 high rated restaurants in each city?
3. What are the top 3 most affordable restaurants in respective cities having rating more than 4?
4. Which is the most common cuisine among the restaurants?
5. What is the average rating of the restaurants?
6. What is the maximum and minimum cost of dining in the restaurants?
7. What is the correlation between the restaurant rating and the cost of dining?
8. What is the median cost of dining in the restaurants?
9. What is the percentage distribution of restaurants across different cost ranges?
10.How average rating varies across different cost ranges.
11.What is the average rating for Pune?

## Dashboard
![image](https://github.com/Rupanavale/EDA-of-Dineout-Using-MySQL/assets/109949193/16aabcc4-0d02-4e65-9d68-3b05dd656d10)

## Insights
1. North Indian & Chinese are the highest rated cuisines followed by fast food.
2. South Delhi,Central Delhi & West Delhi have gained the highest votes by customers respectively which dictates the high in demand locality.
3. The average of rating is 4.09 which indicates that customers are enjoying the offerings provided by dineout.
4. Benglore is the highest rated city followed by Delhi & Mumbai.

## License

This project is licensed under the [MIT License](LICENSE).
