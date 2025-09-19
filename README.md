# NutriFit

A simple Flutter app to build meals from ingredients and calculate total macros (kcal, protein, carbs, fat).

---

## 🚀 Features
- Select ingredients from a predefined list (JSON dataset).
- Enter grams for each ingredient.
- Automatically calculate macros based on (per 100g × grams / 100).
- Show running totals for kcal, protein, carbs, and fat.
- Clean UI with a single main screen, modular widgets.
- State management with Riverpod.

---

## 🏗️ Architecture
- **Models**: Ingredient, MealEntry.
- **Services**: Macro calculation.
- **UI**: Split into sections (Ingredient list, Totals bar, etc.).
- **State Management**: Riverpod for reactive updates.

---

## 📂 Project Structure
