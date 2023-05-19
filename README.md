# Analytics Engineer Project with DBT, BigQuery and Looker Studio

This project uses the SAP Adventure Works database to demonstrate the capabilities of an analytics engineer using DBT, BigQuery and Looker Studio (formerly Data Studio).

## Architecture

The architecture of this project is based on the DBML file `analytics_engineer_dbt/moder_stack_DDL.dbml`. It includes the following components:

- **SAP Adventure Works database**: The source of data for this project.
- **DBT**: Used to transform the data from the SAP Adventure Works database into a format suitable for analysis.
- **BigQuery**: Used as the data warehouse to store the transformed data.
- **Looker Studio**: Used to create visualizations and reports based on the data stored in BigQuery.

## Usage

To use this project, follow these steps:

1. Clone this repository.
2. Set up the necessary credentials for accessing the SAP Adventure Works database, BigQuery and Looker Studio.
3. Run the DBT commands to transform the data.
4. Use Looker Studio to create visualizations and reports.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request if you have any suggestions or improvements.

## License

This project is licensed under the [MIT License](LICENSE).
