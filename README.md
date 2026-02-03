Currency Converter App (Flutter)

A simple, clean, and beginner-friendly: **Currency Converter** mobile app, built using **Flutter**.  
This app allows users to convert amounts between multiple currencies using real-world conversion logic (just like Play Store currency apps).


**Features:**

- Convert between multiple currencies (USD, INR, EUR, GBP, JPY, SAR)
- Two-way conversion (From → To any currency)
- Realistic conversion logic (not hard-coded)
- Clean & modern UI (My personal fav blue)
- Responsive layout for different screen sizes
- Fast and lightweight


**Tech Stack:**

- Flutter
- Dart
- Material UI


**Conversion Logic (How it works)**

All currency values are stored relative to a **base unit**.

Formula used:
convertedAmount = (amount / rateOfFromCurrency) × rateOfToCurrency

This is the **same logic used by real currency apps**.

This ensures:
- Correct **two-way conversion**
- No currency is treated as “special”
- Works exactly like **Play Store currency apps**

