# dbt Project

## Overview
This project is built using **dbt (Data Build Tool)** to transform and manage data in a structured and scalable way, specifically for **Snowflake**.

## Setup Instructions
### 1. Clone the Repository
```sh
git clone <repo_url>
cd <project_directory>
```

### 2. Install Dependencies
Ensure you have dbt installed. If not, install it using:
```sh
pip install dbt-core dbt-snowflake
```

### 3. Configure dbt Profile
Set up your `profiles.yml` file in `~/.dbt/` with the following Snowflake configuration:
```yaml
snowflake_project:
  outputs:
    dev:
      type: snowflake
      account: <your_snowflake_account>
      user: <your_username>
      password: <your_password>
      role: <your_role>
      database: <your_database>
      warehouse: <your_warehouse>
      schema: <your_schema>
      threads: 4
  target: dev
```

### 4. Run dbt Commands
- **Seed the database with static data:**
  ```sh
  dbt seed
  ```
- **Run models:**
  ```sh
  dbt run
  ```
- **Test models:**
  ```sh
  dbt test
  ```
- **Generate documentation:**
  ```sh
  dbt docs generate
  dbt docs serve
  ```

## API Key Troubleshooting
If you encounter **API key errors**, ensure:
- Your API key is valid and has the correct permissions.
- You include `Authorization: Token <your-api-key>` in API requests.
- Your API key is associated with the correct dbt Cloud account.

## Project Structure
```
/dbt_project
│-- models/        # dbt models (SQL transformations)
│-- seeds/         # CSV seed files
│-- tests/         # Data quality tests
│-- macros/        # Reusable dbt macros
│-- dbt_project.yml  # Project configuration
```

## Contribution
Feel free to open issues or submit pull requests to improve this project!

## License
This project is licensed under the MIT License.
