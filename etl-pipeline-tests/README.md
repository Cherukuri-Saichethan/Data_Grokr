# ETL Pipeline + Tests

A Python ETL pipeline that fetches user data from a REST API, transforms it using pandas, saves it to CSV, and tests the transformation using pytest.

## Technologies

- Python
- Requests
- Pandas
- Pytest
- REST API
- JSON
- CSV

## Project Structure

- fetch_api.py - Fetches data from REST API
- generator.py - Uses yield to process data lazily
- transform.py - Transforms data using pandas
- pipeline.py - Runs the complete ETL pipeline
- test_pipeline.py - Contains pytest tests
- users_output.csv - Generated output

## ETL Flow

REST API → JSON → Generator → Pandas → CSV

## Testing

The project includes:

- Test cases
- Fixtures
- Parametrize

Run tests:

```bash
pytest etl-pipeline-tests/test_pipeline.py