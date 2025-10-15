# Batch Project Template

## Folder Structure
src/
├── data_ingestion/
├── data_processing/
├── data_quality/
├── utils/
tests/
├── unit/
├── integration/
├── data_validation/
config/
├── dev/
├── staging/
├── prod/
docs/
scripts/

## Sample Pipeline Flow
1. Extract data from source systems (databases, APIs, files)
2. Transform / clean data in batch jobs
3. Validate data quality
4. Load processed data into storage or warehouse
5. Generate reports or dashboards

## CI/CD Hooks
- **ci.yml**: Run unit and integration tests on every PR
- **data-validation.yml**: Validate batch jobs before merge
- **cd.yml**: Deploy batch pipeline to dev/staging/prod
