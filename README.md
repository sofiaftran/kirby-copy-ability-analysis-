# Kirby Copy Ability Analysis
### Product Analytics & User Behavior Analysis using SQL and Tableau

[View Notion Portfolio Presentation](https://app.notion.com/p/sofia-tran/Project-1-Kirby-Copy-Abilities-Feature-Adoption-Usage-Analysis-3c78a03bcb5a807fba04fa9b28f17250)) | [View Tableau Dashboard Screenshot](https://github.com/sofiaftran/kirby-copy-ability-analysis-/blob/main/images/tableau_dashboard.png)

---

## Project Overview

This project investigates how players use different Kirby copy abilities and tests the initial assumption that approximately 80% of players primarily use Sword.

The analysis uses fictional player behavior and ability characteristic data to examine:

- Ability adoption
- Usage share
- Enemy defeat share
- Average damage per use
- Unlock timing
- Difficulty
- Attack type

---

## Key Findings

- Most abilities were adopted by at least 80% of players, so the initial Sword assumption was not supported.
- Sword had the highest usage share at 22.5%.
- Enemy defeat share generally followed usage share.
- Average damage per use, difficulty and unlock timing did not show a consistent relationship with usage.
- Utility abilities such as Leaf, Sleep, and Tornado consistently appeared toward the lower end of usage.

The analysis suggests that attack type is an area worth investigating further, but the available data does not explain why players use some abilities less frequently.

---

## Tools

- Google BigQuery / SQL
- Tableau
- CSV
- Notion
- GitHub
  
---

## Repository
```text
sql/              SQL analysis queries
data/             Fictional datasets
tableau/          Tableau workbook
documentation/    Supporting documentation
images/           Project screenshots and visualizations
```
  
---

## Data

The analysis uses two primary tables:

- `ability_usage` — player ability usage and combat behavior
- `abilities` — ability characteristics

`players` and `player_sessions` were available in the dataset but were not required for this analysis.
  
---

## Disclaimer

This project uses mock data created for portfolio and learning purposes. It is not based on actual Kirby player data and is not affiliated with or endorsed by Nintendo.
