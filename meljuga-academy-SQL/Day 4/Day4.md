# SQL - Day 4 - PowerBI

## Task submissions

Create a new folder called `Day 4` in your project repository `C:\Users\<YourUser>\Projects\<user>-academy-sql\` and save all the tasks in your repo as `sql_day4.pbix`.

## Prerequisites

**Step 1**: Install Power BI Desktop:  https://www.microsoft.com/store/productId/9NTXR16HNW1T

**Step 2**: Install ODBC Driver:  https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc.html

## Additional Resources

- https://medium.com/squareshift/all-you-need-to-know-about-connecting-to-amazon-athena-with-odbc-b53f0e62479e
- https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc-driver-and-documentation-download-links.html
- https://docs.aws.amazon.com/athena/latest/ug/connect-with-odbc-and-power-bi.html

## Tasks

For every task create a new page (new sheet) and name it `Day4_<n>` where n is the number of the task.
When you are done, publish Your report to your worksace and name it `<user>_sql_day4.pbix`


1. Create a PBI report to retrieve the average of *average rating* from the `title_ratings__v` view for all records that have tconst starting with `tt0000`.

2. Create a PBI report to retrieve ids of the *titles* and their *average ratings* from the `title_ratings__v` view, filtering for *titles* with more than 1000 *votes*.

3. Create a PBI report to retrieve the *titles* from the `title_basics__v` view that have a title type of *Movie* and have a start year between 1900 and 1920.

4. Find *title ids* for *movies* with *rating* between 7 and 9. Use `title_ratings__v` view.

5. Find *actors* who have also directed *movies* and pull out *movies* with *rating* between 7.5 and 10 they have directed. 
    - Display the data in a way that the highest *rated movies* are on the top. 
    - Use `name_basics__v`., `title_principals__v` and `title_ratings__v` views.

6. Create PBI report with a subset of TV *series* and for that data calculate the number of *episodes* in all *seasons* and ordered it by *episode number*. Use `title_episode__v` view.

7. Create PBI report with 25 *title ids* with the highest number of *votes*. Use `title_ratings__v` view.

8. Calculate the total number of *votes* for *movie* ids from `tt000001` to `tt0000025` and the total number of *titles* that have an *average rating* between 5.0 and 7.0. Create a report with that data. Use `title_ratings__v` view.

9. Create PBI report with the following stats:
    - Total number of *movies* Bruce Lee worked on,
    - Total number of *votes* for all *titles* Bruce Lee worked on,
    - *Average rating* from all *titles* Bruce Lee worked on.

10. Create a report with the following:
    - Choose 5 *actors*,
    - Show all the *titles* they worked on,
    - Calculate the total number of *votes* for each title,
    - Calculate the *average rating* for each title,
    - Calculate the number of *movies* they worked on.

11. Show *movie* details for *movies* with two *genres* which are not adult *movies*.

12. Since the *primary_profession* column in `name_basics__v` view has comma delimited values, show distinct *primary profession* per nconst, and *primary_name*. Split the array and capitalize first letter in profession values. Use data transformations.

13. Show the total number of TV show *episodes* for every TV show's *season* 1.
