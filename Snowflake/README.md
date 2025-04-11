** See repo README for high level directions. Keep reading for some Snowflake specific setup. **

1. Setup schemas on Snowflake. By default this project uses two schemas which can be created wtih teh following code.
```
CREATE DATABASE IF NOT EXISTS main;

CREATE SCHEMA IF NOT EXISTS dbtpcdi_staging;

CREATE SCHEMA IF NOT EXISTS dbtpcdi_prod;
```

2. Create the required stage in both the staging and target schema.

Example for Azure:
```
CREATE STAGE uc_westus_tpcdi_files
storage_integration = azure_uc_int
url = 'azure://mystorageacc.blob.core.windows.net/my-container/tpcdi/sf=10';
```

3. Upload files to that storage location.

4. Create file formats in both the staging schema and the target schema. These format create scripts are found in `helpers` directory.

5. As mentioned in the Repo README, run the following to setup and test...
```
dbt run-operation stage_external_sources

dbt run
```
_Optional: Run only a single model by adding `--select <model_name>`_

