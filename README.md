# BLS Unemployment Data Retriever


## 🔍 What This Repository Does

This repository automatically retrieves monthly **seasonally adjusted** unemployment data for:
- **All 50 U.S. States** + District of Columbia and Puerto Rico

**Important Note:** The BLS only provides seasonally adjusted unemployment rates at the state level and above. Counties, cities, and local areas receive unemployment data on a **not seasonally adjusted basis only**. This repository focuses specifically on seasonally adjusted data to provide the most accurate month-to-month unemployment comparisons.

## 📊 Why Seasonally Adjusted Data?

Seasonally adjusted unemployment rates remove predictable seasonal patterns (like holiday hiring or agricultural cycles) to reveal underlying economic trends. The BLS uses sophisticated **Signal-Plus-Noise Models** for state-level data that can reliably separate seasonal patterns from true economic changes, making this data ideal for:
- Month-to-month unemployment trend analysis
- Economic policy analysis
- Business cycle research
- Media reporting on employment conditions


## 🏗️ Repository Structure

```
.
├── Dockerfile                    # Docker container configuration
├── entrypoint.sh                # Script execution orchestrator
├── README.md                    # This file
├── requirements.txt             # Python dependencies
├── laus-fetchers/              # Core data fetching scripts
│   ├── stateUnemployment.py    # Fetches state-level data
│   ├── ~~countyUnemployment.py~~   # Discontinued
│   ├── ~~placeUnemployment.py~~    # Discontinued
│   └── merger.py               # Combines all data into single CSV
├── series-ids/                 # BLS series ID configurations
│   ├── series_ids_states.json        # State series IDs
│   ├── series_ids_county_master.json # County series IDs
│   ├── series_ids_city.json          # City/place series IDs
│   ├── series_ids_master.json        # Combined series IDs
│   └── state_abbreviations.json      # State name mappings
└── .github/workflows/
    └── fetch_data.yml          # Monthly automated data collection
```


## ⚙️ Configuration Options

### Modifying Data Collection Parameters

Each fetcher script contains configurable parameters that you can modify:

#### Year Range Configuration
In the python script look for the payload section:

```python
payload = {
    "seriesid": series_ids,
    "startyear": "2025",      # ← Modify this
    "endyear": "2025",        # ← Modify this
    "annualaverage": True,
    "catalog": True,
    "registrationkey": registration_key
}
```

**Example modifications:**
- **Historical data:** Change `"startyear": "2020"` and `"endyear": "2025"`
- **Single year:** Keep both start and end year the same
- **Multiple years:** Set different start/end years (max 20 years per API call)


## 📅 Automated Monthly Updates

The repository includes a GitHub Actions workflow (`.github/workflows/fetch_data.yml`) that automatically:
- Runs on the **21st of every month** at 2:00 AM UTC
- Fetches the latest unemployment data
- Can be triggered manually via GitHub Actions interface
- Stores data with monthly timestamps

## 📈 Output Data

### Generated Files

- `Unemployment_data.csv` - **Combined dataset** with all geographic levels

### Data Schema
Each CSV contains the following columns:
- **GeoID** - Geographic identifier code
- **Series ID** - BLS series identifier
- **Place** - Geographic area name
- **Year** - Data year
- **Month** - Data month  
- **Unemployment Rate** - Seasonally adjusted unemployment rate (%)

## 📄 License

This project fetches publicly available data from the U.S. Bureau of Labor Statistics. Please refer to [BLS usage guidelines](https://www.bls.gov/developers/) for data usage terms.

---

**Data Source:** [Bureau of Labor Statistics - Local Area Unemployment Statistics](https://www.bls.gov/lau/)  
**API Documentation:** [BLS Public Data API](https://www.bls.gov/developers/api_signature_v2.htm)
