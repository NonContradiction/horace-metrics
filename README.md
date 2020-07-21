# horace-metrics
This is an R analysis in bar charts of the different poetic schemas used by the Latin poet Horace

The textual authority followed was that of Daniel H. Garrison, editor for the Oklahoma Series in Classical Culture volume of Horace's Odes & Epodes (and the Carmen Saeculare).

The RShiny app was launched from a local directory containing the ui.R and server.R files, and a sub-directory entitles "data" containing the odes.csv data file.

In a perfect world, future development would include reactivity so that a single tab with a radio or drop-down selection from the user could reorder the bars for line totals by poetry collection or could change the poems bar variable between counts and line summation. Though a halmark of RShiny, this is proving difficult to implement, esp. in a way that hides from the EU the messiness of options like "reorder(Collection, -Lines, sum)".

The final product may be viewed here: https://noncontradiction.shinyapps.io/horace/
