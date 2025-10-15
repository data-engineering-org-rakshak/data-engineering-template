# Machine Learning Project Template

## Folder Structure
src/
├── data_ingestion/
├── data_processing/
├── feature_engineering/
├── model_training/
├── model_evaluation/
├── utils/
tests/
├── unit/
├── integration/
config/
├── dev/
├── staging/
├── prod/
docs/
scripts/
models/
├── saved_models/
├── training_logs/

## Sample Pipeline Flow
1. Ingest raw data
2. Clean and preprocess data
3. Feature engineering
4. Train and evaluate ML models
5. Save trained models and logs
6. Deploy models for inference

## CI/CD Hooks
- **ci.yml**: Run tests and linting
- **data-validation.yml**: Validate input datasets
- **cd.yml**: Trigger ML model training and deployment
