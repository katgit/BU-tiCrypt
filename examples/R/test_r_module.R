cat("Loading iris dataset...\n")
data(iris)

cat("Dataset dimensions:", nrow(iris), "rows x", ncol(iris), "cols\n")
cat("Species counts:\n")
print(table(iris$Species))

cat("\nComputing per-species mean sepal length...\n")
means <- aggregate(Sepal.Length ~ Species, data = iris, FUN = mean)
print(means)

cat("\nFiltering to setosa with Petal.Length > 1.5...\n")
subset_df <- iris[iris$Species == "setosa" & iris$Petal.Length > 1.5, ]
cat("Rows matching filter:", nrow(subset_df), "\n")

cat("\nGenerating plot -> iris_plot.png\n")
png("iris_plot.png", width = 800, height = 600)
plot(iris$Sepal.Length, iris$Sepal.Width,
     col = as.integer(iris$Species),
     pch = 19,
     xlab = "Sepal Length",
     ylab = "Sepal Width",
     main = "Iris: Sepal Length vs Width by Species")
legend("topright",
       legend = levels(iris$Species),
       col = 1:3, pch = 19)
dev.off()

cat("Done.\n")
