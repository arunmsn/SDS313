# Setting up the initial table
bonds <- read.csv('Homework1_Bonds.csv')
bonds

# QUESTION 1
table(bonds$Result)
# Carried = 7210, Defeated is 1638

# Displays the porportions for each type of government
prop.table(table(bonds$Type, bonds$Result), 1) 

# Displays the values of how many bonds were approved and defeated per type of government
table(bonds$Type, bonds$Result)


# QUESTION 2
# sums up all votes for every bond election
bonds$Votes_Total <- bonds$VotesFor + bonds$VotesAgainst
# modifies the bonds table to add the column Votes_Total from largest value to smallest
bonds = bonds[order(bonds$Votes_Total, decreasing = TRUE),]
# the next lines simply get the top 6 values of each category
head(bonds$Name)
head(bonds$Type)
head(bonds$ElectionDate)
head(bonds$Description)
head(bonds$VotesFor)
head(bonds$VotesAgainst)
head(bonds$Votes_Total)


# QUESTION 3
# creates a subset of the bonds table which only contains bonds that were:
#   1) approved
#   2) had at least 100 total votes
bonds_approved_wmin <- bonds[bonds$Result == "Carried" & bonds$Votes_Total >= 100,]
bonds_approved_wmin

# plots the percentage of total votes as a scatter plot
total_votes_per_record = plot((((bonds_approved_wmin$VotesFor)/bonds_approved_wmin$Votes_Total) * 100), xlab = "Record Number", ylab = "Percent of Total Votes", main = "Percent of Total Votes per Record")
fivenum((((bonds_approved_wmin$VotesFor)/bonds_approved_wmin$Votes_Total) * 100))
sd((((bonds_approved_wmin$VotesFor)/bonds_approved_wmin$Votes_Total) * 100))
mean((((bonds_approved_wmin$VotesFor)/bonds_approved_wmin$Votes_Total) * 100))


# QUESTION 4
# plots the cost of the bond against the percentage of total votes
cost_vs_total_votes = plot((((bonds_approved_wmin$VotesFor)/bonds_approved_wmin$Votes_Total) * 100), bonds_approved_wmin$Amount, xlab = "Percent of Total Votes", ylab = "Cost", main = "Cost per Percent of Total Votes")
# cost_vs_total_votes gives us the comparison between the percentage of bonds that won
#   and how much the bond was, essentially seeing if there is a relationship between them
cor((((bonds_approved_wmin$VotesFor)/bonds_approved_wmin$Votes_Total) * 100), bonds_approved_wmin$Amount)
