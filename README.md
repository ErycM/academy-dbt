# Analytics Engineer DBT Project

This repository contains an analytics engineering project that utilizes the SAP Adventure Works database. The project is built using DBT (Data Build Tool), BigQuery, and Looker Studio (formerly known as Data Studio) to create a comprehensive analytics solution.

## Table of Contents

- [Project Overview](#project-overview)
- [Architecture](#architecture)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The main goal of this project is to demonstrate the implementation of an analytics engineering workflow using DBT, BigQuery, and Looker Studio. By leveraging these tools, you can perform data transformations, build data models, and create interactive dashboards for data exploration and analysis.

The SAP Adventure Works database is a sample database widely used for testing and learning purposes. It provides a realistic dataset that represents a fictional bicycle company's operations, including sales, production, and customer information.

## Architecture

The project architecture is designed to facilitate data transformation, modeling, and visualization. The following files and directories are included:

- **analytics_engineer_dbt/dbt_project.yml**: This YAML file contains the configuration for the DBT project. It specifies project-level settings, such as the project name, version, and dependencies.

- **analytics_engineer_dbt/profiles.yml**: This YAML file defines the database connection details for the BigQuery data warehouse. You need to update this file with your own credentials and connection information.

- **analytics_engineer_dbt/models/**: This directory contains SQL-based model files that define the data transformations and logic for creating analytics outputs. Each model represents a specific data entity or business process.

- **analytics_engineer_dbt/macros/**: This directory includes SQL macros that provide reusable snippets of SQL code. Macros can be used to modularize common transformations, calculations, or business rules, enabling better code organization and maintainability.

- **analytics_engineer_dbt/data/**: This directory can be used to store additional data files or resources required for the data transformations. For example, if you need reference tables or lookup tables, you can place them here.

- **analytics_engineer_dbt/tests/**: This directory contains test files that validate the correctness of the data transformations. Tests ensure that the expected outputs match the actual outputs and help maintain data quality and reliability.

Please refer to the DBML file [analytics_engineer_dbt/moder_stack_DDL.dbml](analytics_engineer_dbt/moder_stack_DDL.dbml) for a visual representation of the project architecture.

## Getting Started

To get started with this project, follow the steps below:

1. Clone the repository to your local machine: `git clone https://github.com/ErycM/analytics_engineer_dbt.git`
2. Configure the `dbt_project.yml` file in the `analytics_engineer_dbt` directory to customize the project settings.
3. Update the `profiles.yml` file in the `analytics_engineer_dbt` directory with your BigQuery database connection details.
4. Use the DBT commands to compile and execute the SQL transformations:
   - Run `dbt compile` to compile the project and generate the necessary artifacts.
   - Run `dbt run` to execute the data transformations and load the transformed data into the BigQuery data warehouse.

## Usage

Once you have executed the DBT commands and the data transformations are complete, you can leverage Looker Studio (or any other BI tool of your choice) to explore and visualize the transformed data. Connect Looker Studio to your BigQuery dataset and create interactive dashboards, reports, and visualizations.

Feel free to extend and customize the project according to your specific analytics requirements. You can add new models, modify existing ones, create additional macros, or incorporate more advanced data transformations.

## Contributing

Contributions to this project are welcome! If you encounter any issues, discover bugs, or have suggestions for improvements, please open an issue on the [GitHub repository](https://github.com/ErycM/analytics_engineer_dbt). You can also submit a pull request with your proposed changes.

## License

This project is licensed under the [MIT License](LICENSE).
