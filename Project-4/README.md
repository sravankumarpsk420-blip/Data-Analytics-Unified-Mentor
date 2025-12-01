# Regulatory Affairs of Road Accident Data – 2020

## Analysis Report

### Introduction
This project analyzes road accident data from 50 million-plus Indian cities for the year 2020. The dataset records accident causes, subcategories, outcomes, and counts (in millions).
The purpose of this study is to understand accident patterns, identify high-risk cities and causes, and support regulatory authorities in strengthening urban road safety.

### Objectives
Analyze accident causes across major cities.
Identify dominant cause categories and subcategories.
Study outcome distribution (injuries, fatalities, total accidents).
Build a Random Forest model to predict accident outcomes.
Generate SQL-based summary metrics.
Provide safety recommendations based on analytical insights.

### Dataset Description
Million plus cities
Cause Category (Traffic Control, Junction, Road Features, Weather, Impacting Vehicle/Object, etc.)
Cause Subcategory (e.g., Overtaking, Sunny/Clear, Others)
Outcome of Incident (Minor Injury, Grievously Injured, Persons Killed, Total Injured, Total Accidents)
Count (in millions)

The Exploratory Data Analysis highlights key accident patterns across major Indian cities. A bar chart of the top 10 cities shows that Chennai reports the highest number of accidents, while Amritsar records the lowest, indicating large variation in traffic exposure and road conditions. Analysis of accident categories using bar plots reveals that incidents are distributed across multiple major causes, including Road Features, Traffic Control, Junction issues, Traffic Violations, and Weather Conditions, showing no single dominant category.

Subcategory analysis using histogram and line plots shows that ‘Others’, ‘Sunny/Clear’, and ‘Overtaking’ are the most frequently reported specific causes, emphasizing reporting gaps and behavioural risk factors. The outcome distribution visualized through a pie chart indicates that Minor Injuries, Grievously Injured, Persons Killed, and Total Accidents each contribute approximately 20.9% of records, while Total Injured accounts for about 16.2%, reflecting a balanced distribution across severity levels.

### Machine Learning Model Summary (Prediction)

A Random Forest Classifier was developed to predict accident outcomes based on key explanatory variables. The model utilized three primary features:
City
Cause Category
Cause Subcategory

This model was selected for its robustness and ability to handle categorical variables with complex interactions. It effectively learned patterns within the dataset to classify accident outcomes with improved accuracy compared to simpler algorithms.

A total of 989,334 accidents were recorded. Accident distribution across major cause categories showed that Road Features, Traffic Control, Junction, Traffic Violation, and Weather Conditions each accounted for approximately 173,300 incidents, while Impacting Vehicle/Object contributed 122,793 accidents, making it the least frequent primary cause category. Across subcategories, ‘Others’ recorded the highest number of incidents (283,486), followed by ‘Sunny/Clear’ (126,904) and ‘Overtaking’ (123,013). City-wise patterns revealed high fatality percentages in Ludhiana (27%), Asansol–Durgapur (26%), and Amritsar (24%), whereas Kochi reported a significantly lower fatality rate of 2.9%. Chennai had the highest total accidents (78,459), while Amritsar had the lowest (1,645), showcasing major variations in traffic exposure and road safety conditions across cities.

### Key Findings

Road Features, Traffic Control, and Junction-related issues are leading contributors.
“Others” being the top subcategory highlights gaps in reporting and classification.
High fatality cities like Ludhiana require urgent intervention.
Cities with high accident volume (e.g., Chennai) need road design and enforcement improvements.
Prediction accuracy is low → dataset requires richer features.

### Safety Measures & Recommendations
To reduce accident frequency and severity, the following key measures are recommended:
Strengthen traffic enforcement: Implement stricter monitoring of speed, overtaking, and lane violations using CCTV and automated challan systems.
Improve road infrastructure: Enhance signage, lighting, lane markings, and junction design—especially in high-risk areas identified by data.
Driver awareness programs: Conduct targeted campaigns on safe driving, weather-related precautions, and responsible overtaking.
Technology adoption: Promote vehicle safety features (ABS, ADAS) and deploy real-time traffic alerts through navigation systems.
Emergency response enhancement: Improve coordination among police, hospitals, and emergency units to reduce response time and improve survival outcomes.
Data-driven monitoring: Continuously analyze accident patterns to update risk zones and evaluate the effectiveness of safety interventions.

### Conclusion
The analysis highlights significant variation in accident patterns across Indian cities. Some cities face extremely high fatality rates, while others record high accident frequencies. Major accident causes include road design and traffic control failures, while behavioural factors like overtaking also play a critical role.
With improved data collection, targeted infrastructural reforms, and stronger enforcement, road accident severity and frequency can be substantially reduced.
