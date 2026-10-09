# Airbnb Analytics Pipeline (dbt + Snowflake)

A portfolio data-engineering project that transforms Airbnb source data into analytics-ready Snowflake models using dbt and SQL.

## Architecture

```text
Snowflake staging sources
        |
        v
Bronze: incremental raw copies
        |
        v
Silver: cleaned and enriched booking, listing, and host models
        |
        v
Gold: One Big Table (OBT), fact table, and historical snapshot dimensions
```

## What this project demonstrates

- Incremental Bronze and Silver dbt models for bookings, listings, and hosts.
- Reusable macros for calculations and categorisation.
- A Gold One Big Table (OBT) joining the analytics entities.
- A Gold fact model for booking analytics.
- dbt snapshots for booking, host, and listing history.
- A source data-quality test that rejects missing or negative booking amounts.

## Project layout

```text
models/
  sources/   # Snowflake source definitions
  bronze/    # incremental raw-layer models
  silver/    # cleaned and enriched models
  gold/      # OBT, fact, and ephemeral dimension models
snapshots/   # slowly changing dimension history
macros/      # reusable SQL/Jinja helpers
tests/       # data-quality tests
analyses/    # exploratory dbt queries
```

## Local setup

1. Create and activate a Python environment, then install the dbt Snowflake adapter.
2. Copy the safe template and enter your own Snowflake connection values:

   ```bash
   cp profiles.yml.example profiles.yml
   ```

3. Run the project from this directory:

   ```bash
   dbt debug
   dbt parse
   dbt test
   dbt run
   dbt snapshot
   ```

`profiles.yml` is deliberately excluded from Git. Never commit passwords, keys, tokens, or account-specific connection settings.

## Notes

The source definitions point to an `AIRBNB.STAGING` Snowflake schema. Create/load those source tables in your own Snowflake account before running the models. Object names, warehouse settings, and row counts will differ by environment.
