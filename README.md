# Data-Bank-Case-Study_using_SQL

The website page for the case study can be found [here](https://8weeksqlchallenge.com/case-study-4/).

## Description

There is a new innovation in the financial industry called Neo-Banks: new aged digital only banks without physical branches.

Danny thought that there should be some sort of intersection between these new age banks, cryptocurrency and the data world. So he decides to launch a new initiative - Data Bank!

Data Bank runs just like any other digital bank - but it isn’t only for banking activities, they also have the world’s most secure distributed data storage platform!

Customers are allocated cloud data storage limits which are directly linked to how much money they have in their accounts. Data Bank is run off a network of nodes where both money and data is stored across the globe. In a traditional banking sense - you can think of these nodes as bank branches or stores that exist around the world.

Customers are randomly distributed across the nodes according to their region - this also specifies exactly which node contains both their cash and data. This random distribution changes frequently to reduce the risk of hackers getting into Data Bank’s system and stealing customer’s money and data.

## Problem Statement

The management team at Data Bank want to increase their total customer base - but also need some help tracking just how much data storage their customers will need.

This case study is all about calculating metrics, growth and helping the business analyse their data in a smart way to better forecast and plan for their future developments. It aims to mimic traditional banking style transactions data but with a twist.

## Available Data

A data model is prepared to help with the case study. The entity-relationship diagram below depicts the relation between the tables and the table schema.

1. The regions table contains the region_id and their respective region_name values.
2. The customer_nodes table records which node of a region is allocated to the customer along with the start and end date of the allocation period.
3. The customer_transactions table stores all customer deposits, withdrawals and purchases made using their Data Bank debit card.

## Case Study Questions

### A. Customer Nodes Exploration

1. How many unique nodes are there on the Data Bank system?
2. What is the number of nodes per region?
3. How many customers are allocated to each region?
4. How many days on average are customers reallocated to a different node?
5. What is the median, 80th and 95th percentile for this same reallocation days metric for each region?

### B. Customer Transactions

1. What is the unique count and total amount for each transaction type?
2. What is the average total historical deposit counts and amounts for all customers?
3. For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?
4. What is the closing balance for each customer at the end of the month?
5. What is the percentage of customers who increase their closing balance by more than 5%?

## Solutions

The queries for the questions listed above can be found in the [SQL_queries](./SQL_queries/) folder and the respective query results can be found in the [Query_Results](./Query_Results/) folder.

The file naming convention followed is <alphabet><question_number>. For example, A1 refers to first wquestion of customer nodes exploration.

The queries are written in Postgresql.
