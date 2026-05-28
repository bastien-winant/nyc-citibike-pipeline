# kestra-citibike-openweather

**An end-to-end data pipeline for CitiBike usage analysis using the Citi Bike Trip Histories and the OpenWeather API.**

Built by [Bastien Winant](https://linkedin.com/in/winant) · Climate Data Engineer  
Stack: Python · BigQuery · Kestra · Streamlit · GitHub Actions

---

## What This Pipeline Does

Ingests, validates, models, and analyzes historical NYC bike rental data pulled directory from the Citibike source system.
Produces a publication-ready analytical dataset and live Streamlit dashboard.

---

## Architecture

```
┌─────────────────────────────────────────────────────────┐
│                     Data Sources                        │
│  CitiBike System Data (citibikenyc.com/system-data)     │
│  OpenWeather API  (openweathermap.org)                  │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│              Ingestion & Validation                     │
│  kestra/flows/main_company.team_data-extract.py         │
│  · Schema checks · Row count assertions · MD5 checksums │
│  · Saves timestamped snapshots to data/raw/             │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│               Kestra Transformations                    │
│  kestra/flows/main_company.team_load.yml                │
│  kestra/flows/main_company.team_transform.yml           │
│  · Runs in BigQuery                                     │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                    Analysis                             │
│  orchestration/pipeline_dag.py — Airflow DAG            │
│  · 5 key findings · Chart-ready exports                 │
└────────────────────┬────────────────────────────────────┘
                     │
                     ▼
┌─────────────────────────────────────────────────────────┐
│                   Dashboard                             │
│  dashboard/app.py — Streamlit                           │
│  · Live KPIs · Interactive charts · Methodology notes  │
└─────────────────────────────────────────────────────────┘
```