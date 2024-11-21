# Load ggplot2
library(ggplot2)

# Generate sample data
set.seed(123)  # For reproducibility
data <- data.frame(
  x = rnorm(100),
  y = rnorm(100),
  category = sample(letters[1:3], 100, replace = TRUE),
  group = sample(c("Group 1", "Group 2"), 100, replace = TRUE)
)

# Scatter plot with smooth line
scatter_plot <- ggplot(data, aes(x = x, y = y, color = category)) +
  geom_point(size = 3, alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, linetype = "dashed", color = "black") +
  labs(
    title = "Scatter Plot with Linear Smoothing",
    x = "X-Axis",
    y = "Y-Axis",
    color = "Category"
  ) +
  theme_minimal(base_size = 15) +
  theme(legend.position = "top")

# Bar chart with dodge position
bar_chart <- ggplot(data, aes(x = category, fill = group)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Bar Chart",
    x = "Category",
    y = "Count",
    fill = "Group"
  ) +
  theme_classic(base_size = 15) +
  scale_fill_brewer(palette = "Set2") +
  theme(legend.position = "bottom")

# Density plot with overlay
density_plot <- ggplot(data, aes(x = x, fill = category)) +
  geom_density(alpha = 0.7) +
  labs(
    title = "Density Plot",
    x = "Value",
    y = "Density",
    fill = "Category"
  ) +
  theme_minimal(base_size = 15) +
  scale_fill_manual(values = c("#E41A1C", "#377EB8", "#4DAF4A"))

# Box plot with jittered points
box_plot <- ggplot(data, aes(x = category, y = y, fill = category)) +
  geom_boxplot(outlier.shape = NA, alpha = 0.7) +
  geom_jitter(shape = 21, color = "black", alpha = 0.5, width = 0.2) +
  labs(
    title = "Box Plot with Jittered Points",
    x = "Category",
    y = "Y Values",
    fill = "Category"
  ) +
  theme_light(base_size = 15) +
  scale_fill_brewer(palette = "Pastel1")

# Save all plots to a single PDF
pdf("rplots.pdf", width = 8, height = 6)  # Open a PDF device
print(scatter_plot)
print(bar_chart)
print(density_plot)
print(box_plot)
dev.off()  # Close the PDF device

# Notify user
cat("All plots have been saved to rplots.pdf\n")
