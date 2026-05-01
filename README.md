# Computational Demography: Correlation Between Mental Disorders and Chronic Diseases

## Project Overview
This study explores the complex relationship between mental health and specific individual characteristics, with a primary focus on the prevalence of **Alzheimer’s, Anxiety, and Depression** among individuals suffering from chronic diseases. By identifying key risk factors and their impact, the research aims to support more targeted approaches in prevention, diagnosis, and treatment[cite: 2].

## Dataset & Methodology
- **Source:** The study utilizes the **EHIS_A2015** dataset from the European Health Interview Survey (Ehis), specifically focusing on the Italian resident population[cite: 2].
- **Scope:** The analysis covers three macro-areas: health status, health determinants, and access to healthcare services, integrated with socio-demographic contexts[cite: 2].
- **Sampling:** A complex sampling design was used, covering a theoretical sample of 12,013 households, with a minimum of 18 interviews per sample municipality[cite: 2].

## Data Analysis & Variable Transformation
- **Target Variables:** Alzheimer, Anxiety, and Depression (recoded from string format for separate analysis)[cite: 2].
- **Covariates:** The model includes socio-demographic factors (sex, marital status, income, education, geography) alongside lifestyle variables such as physical activity, diet, and smoking habits[cite: 2].
- **Modeling:** The study employs **Logistic Regression**, providing results in terms of **Odds Ratios** to estimate the propensity of developing these disorders based on various risk factors[cite: 2].

## Key Findings

### 1. Gender and Age Trends
- Across all three disorders, there is a marked prevalence in **women**: 70.73% for Alzheimer’s, 69.65% for Anxiety, and 67.27% for Depression[cite: 2].
- For Alzheimer’s, individuals over the age of 64 show a massive increase in propensity (746%) compared to younger groups[cite: 2].
- Conversely, the propensity for Depression decreases by 12% in the over-64 group compared to those under 64[cite: 2].

### 2. Impact of Chronic Diseases
Chronic conditions significantly increase the odds of mental disorders:
- **Alzheimer’s:** Strongest correlations found with Parkinson's (545% increase), Cirrhosis (442%), and Stroke (95%)[cite: 2].
- **Depression:** Highly correlated with Parkinson's (215% increase), Tumors (154%), and Incontinence (153%)[cite: 2].
- **Anxiety:** Linked to Cirrhosis (167% increase), Parkinson's (120%), and Tumors (112%)[cite: 2].

### 3. Lifestyle and Socio-Demographic Factors
- **Physical Activity:** Regular walking and cycling consistently decrease the propensity for all analyzed mental disorders (e.g., walking reduces Alzheimer's risk by 70% and Depression by 29%)[cite: 2].
- **Employment:** Being employed reduces the propensity for Anxiety by 47% compared to the unemployed, highlighting the impact of job security on mental health[cite: 2].
- **Marital Status:** Separated or divorced individuals generally show a higher propensity for mental health challenges compared to single (never married) individuals[cite: 2].

## Technologies Used
- **Data Processing:** Stata (as indicated by the `.dta` file format and logistic regression output tables)[cite: 2].
- **Statistical Methods:** Logistic Regression, Density Histograms, and Pie Chart Distributions[cite: 2].

## Project Details
- **Author:** Francesco Mannarino[cite: 2]
- **Supervision:** Prof.ssa Manuela Stranges[cite: 2]
- **Date:** December 25, 2023[cite: 2]
